import * as winston from 'winston';
export type Logger = Pick<winston.Logger, 'info' | 'warn' | 'error' | 'debug' | 'level'>;
export declare function getLogger(): Logger;
