import fs from 'fs/promises';
import path from 'path';
import os from 'os';
import { AppConfig, ErrorCode, SpecChainError } from '../types';
import log from '../utils/logger';

const CONFIG_DIR = path.join(os.homedir(), '.specchain');
const CONFIG_FILE = path.join(CONFIG_DIR, 'config.json');

// Default configuration
const DEFAULT_CONFIG: AppConfig = {
  ai: {
    provider: 'openai',
    model: 'gpt-4',
    temperature: 0.7,
    maxTokens: 2000,
    localProvider: 'ollama',
    localModel: 'llama-3.1-8b',
  },
  blockchain: {
    network: 'testnet',
    rpcUrl: 'https://sepolia.infura.io/v3/YOUR_INFURA_KEY',
    contractAddress: '0x0000000000000000000000000000000000000000',
    gasLimit: 500000,
    keyManagement: 'keychain',
  },
  storage: {
    basePath: path.join(os.homedir(), '.specchain'),
    maxVersionHistory: 50,
  },
  user: {
    name: '',
    email: '',
    defaultTags: [],
  },
};

export class ConfigManager {
  private config: AppConfig | null = null;

  async load(): Promise<AppConfig> {
    try {
      // Check if config file exists
      try {
        await fs.access(CONFIG_FILE);
      } catch {
        // Config doesn't exist, create default
        log.info('Config file not found, creating default configuration');
        await this.createDefault();
      }

      // Read config file
      const configData = await fs.readFile(CONFIG_FILE, 'utf-8');
      const loadedConfig = JSON.parse(configData);

      // Merge with defaults (in case new fields were added)
      this.config = this.mergeWithDefaults(loadedConfig);

      // Override with environment variables
      this.applyEnvironmentOverrides();

      log.info('Configuration loaded successfully');
      return this.config;
    } catch (error) {
      log.error('Failed to load configuration', { error });
      throw new SpecChainError(
        ErrorCode.CONFIG_INVALID,
        'Failed to load configuration file',
        error,
        true,
        'Check if the config file is valid JSON'
      );
    }
  }

  async save(config: AppConfig): Promise<void> {
    try {
      // Validate config before saving
      this.validate(config);

      // Ensure config directory exists
      await fs.mkdir(CONFIG_DIR, { recursive: true });

      // Write config file
      await fs.writeFile(CONFIG_FILE, JSON.stringify(config, null, 2), 'utf-8');

      this.config = config;
      log.info('Configuration saved successfully');
    } catch (error) {
      log.error('Failed to save configuration', { error });
      throw new SpecChainError(
        ErrorCode.CONFIG_INVALID,
        'Failed to save configuration file',
        error,
        true,
        'Check file permissions and disk space'
      );
    }
  }

  async createDefault(): Promise<void> {
    await this.save(DEFAULT_CONFIG);
  }

  get(): AppConfig {
    if (!this.config) {
      throw new SpecChainError(
        ErrorCode.CONFIG_MISSING,
        'Configuration not loaded',
        null,
        true,
        'Call load() before accessing configuration'
      );
    }
    return this.config;
  }

  async update(updates: Partial<AppConfig>): Promise<void> {
    const current = this.get();
    const updated = { ...current, ...updates };
    await this.save(updated);
  }

  private mergeWithDefaults(loaded: any): AppConfig {
    return {
      ai: { ...DEFAULT_CONFIG.ai, ...loaded.ai },
      blockchain: { ...DEFAULT_CONFIG.blockchain, ...loaded.blockchain },
      storage: { ...DEFAULT_CONFIG.storage, ...loaded.storage },
      user: { ...DEFAULT_CONFIG.user, ...loaded.user },
    };
  }

  private applyEnvironmentOverrides(): void {
    if (!this.config) return;

    // AI overrides
    if (process.env.OPENAI_API_KEY) {
      this.config.ai.apiKey = process.env.OPENAI_API_KEY;
    }

    // Blockchain overrides
    if (process.env.BLOCKCHAIN_RPC_URL) {
      this.config.blockchain.rpcUrl = process.env.BLOCKCHAIN_RPC_URL;
    }
    if (process.env.CONTRACT_ADDRESS) {
      this.config.blockchain.contractAddress = process.env.CONTRACT_ADDRESS;
    }

    log.debug('Applied environment variable overrides');
  }

  private validate(config: AppConfig): void {
    // Validate AI config
    if (!config.ai.provider || !['openai', 'local'].includes(config.ai.provider)) {
      throw new SpecChainError(
        ErrorCode.CONFIG_INVALID,
        'Invalid AI provider',
        { provider: config.ai.provider },
        false,
        'AI provider must be "openai" or "local"'
      );
    }

    // Validate blockchain config
    if (
      !config.blockchain.network ||
      !['testnet', 'mainnet', 'layer2'].includes(config.blockchain.network)
    ) {
      throw new SpecChainError(
        ErrorCode.CONFIG_INVALID,
        'Invalid blockchain network',
        { network: config.blockchain.network },
        false,
        'Network must be "testnet", "mainnet", or "layer2"'
      );
    }

    // Validate storage config
    if (!config.storage.basePath) {
      throw new SpecChainError(
        ErrorCode.CONFIG_INVALID,
        'Storage base path is required',
        null,
        false,
        'Provide a valid storage path'
      );
    }

    log.debug('Configuration validation passed');
  }
}

// Singleton instance
export const configManager = new ConfigManager();
