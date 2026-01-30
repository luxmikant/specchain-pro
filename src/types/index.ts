// Core data types for SpecChain Pro

export interface SpecDocument {
  metadata: SpecMetadata;
  content: SpecContent;
  proof?: BlockchainProof;
  lineage?: SpecLineage;
}

export interface SpecMetadata {
  id: string;
  author: string;
  createdAt: Date;
  modifiedAt: Date;
  version: string;
  parentSpec?: string;
  tags: string[];
}

export interface SpecContent {
  title: string;
  overview: string;
  requirements: Requirement[];
  architecture: string;
  implementation: string;
  tags: string[];
}

export interface Requirement {
  id: string;
  title: string;
  description: string;
  priority: 'High' | 'Medium' | 'Low';
  acceptanceCriteria: string[];
  userStory?: string;
}

export interface BlockchainProof {
  transactionId: string;
  blockHash: string;
  specHash: string;
  timestamp: Date;
  networkId: string;
  layer2Network?: string;
  gasUsed?: number;
}

export interface SpecLineage {
  parentSpecId?: string;
  parentProofId?: string;
  modifications: SpecDiff[];
  remixReason: string;
  originalAuthor: string;
}

export interface SpecDiff {
  section: string;
  operation: 'add' | 'remove' | 'modify';
  before?: string;
  after?: string;
  timestamp: Date;
}

export interface ProofResult {
  transactionId: string;
  blockHash: string;
  timestamp: Date;
  specHash: string;
  networkId: string;
}

export interface VerificationResult {
  isValid: boolean;
  originalAuthor: string;
  creationTimestamp: Date;
  blockchainRecord?: ProofRecord;
  message: string;
}

export interface ProofRecord {
  specHash: string;
  author: string;
  timestamp: Date;
  transactionId: string;
  blockNumber: number;
}

export interface AppConfig {
  ai: AIConfig;
  blockchain: BlockchainConfig;
  storage: StorageConfig;
  user: UserConfig;
}

export interface AIConfig {
  provider: 'openai' | 'local';
  apiKey?: string;
  model: string;
  temperature: number;
  maxTokens: number;
  localProvider?: 'ollama' | 'lmstudio';
  localModel?: string;
}

export interface BlockchainConfig {
  network: 'testnet' | 'mainnet' | 'layer2';
  layer2Provider?: 'base' | 'polygon' | 'arbitrum' | 'optimism';
  rpcUrl: string;
  contractAddress: string;
  gasLimit: number;
  keyManagement: 'keychain' | 'env';
}

export interface StorageConfig {
  basePath: string;
  maxVersionHistory: number;
}

export interface UserConfig {
  name: string;
  email: string;
  defaultTags: string[];
}

export interface SpecSummary {
  id: string;
  title: string;
  author: string;
  createdAt: Date;
  tags: string[];
  verified: boolean;
}

export enum ErrorCode {
  // AI Errors
  AI_GENERATION_FAILED = 'AI_001',
  AI_INVALID_INPUT = 'AI_002',
  AI_RATE_LIMIT = 'AI_003',

  // Blockchain Errors
  BLOCKCHAIN_NETWORK_ERROR = 'BC_001',
  BLOCKCHAIN_TRANSACTION_FAILED = 'BC_002',
  BLOCKCHAIN_INSUFFICIENT_FUNDS = 'BC_003',
  BLOCKCHAIN_VERIFICATION_FAILED = 'BC_004',

  // Storage Errors
  STORAGE_WRITE_FAILED = 'ST_001',
  STORAGE_READ_FAILED = 'ST_002',
  STORAGE_PERMISSION_DENIED = 'ST_003',
  STORAGE_DISK_FULL = 'ST_004',

  // Export Errors
  EXPORT_FORMAT_INVALID = 'EX_001',
  EXPORT_CONVERSION_FAILED = 'EX_002',

  // Configuration Errors
  CONFIG_INVALID = 'CF_001',
  CONFIG_MISSING = 'CF_002',

  // Network Errors
  NETWORK_TIMEOUT = 'NT_001',
  NETWORK_UNAVAILABLE = 'NT_002',
}

export class SpecChainError extends Error {
  constructor(
    public code: ErrorCode,
    message: string,
    public details?: any,
    public recoverable: boolean = true,
    public suggestedAction?: string
  ) {
    super(message);
    this.name = 'SpecChainError';
  }
}
