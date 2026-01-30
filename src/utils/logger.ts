import winston from 'winston';
import crypto from 'crypto';

// Sensitive data patterns to redact
const SENSITIVE_PATTERNS = [
  /private[_-]?key/gi,
  /api[_-]?key/gi,
  /secret/gi,
  /password/gi,
  /0x[a-fA-F0-9]{64}/g, // Private keys
];

// Redact sensitive data from logs
function redactSensitiveData(data: any): any {
  if (typeof data === 'string') {
    let redacted = data;
    SENSITIVE_PATTERNS.forEach((pattern) => {
      redacted = redacted.replace(pattern, '[REDACTED]');
    });
    return redacted;
  }

  if (typeof data === 'object' && data !== null) {
    const redacted: any = Array.isArray(data) ? [] : {};
    for (const key in data) {
      redacted[key] = redactSensitiveData(data[key]);
    }
    return redacted;
  }

  return data;
}

// Create logger instance
const logger = winston.createLogger({
  level: process.env.LOG_LEVEL || 'info',
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.errors({ stack: true }),
    winston.format.json()
  ),
  defaultMeta: { service: 'specchain-pro' },
  transports: [
    new winston.transports.Console({
      format: winston.format.combine(winston.format.colorize(), winston.format.simple()),
    }),
  ],
});

// Add correlation ID to logs
export function createCorrelationId(): string {
  return crypto.randomBytes(16).toString('hex');
}

// Wrapper functions with redaction
export const log = {
  error: (message: string, meta?: any, correlationId?: string) => {
    logger.error(message, {
      ...redactSensitiveData(meta),
      correlationId,
    });
  },

  warn: (message: string, meta?: any, correlationId?: string) => {
    logger.warn(message, {
      ...redactSensitiveData(meta),
      correlationId,
    });
  },

  info: (message: string, meta?: any, correlationId?: string) => {
    logger.info(message, {
      ...redactSensitiveData(meta),
      correlationId,
    });
  },

  debug: (message: string, meta?: any, correlationId?: string) => {
    logger.debug(message, {
      ...redactSensitiveData(meta),
      correlationId,
    });
  },
};

export default log;
