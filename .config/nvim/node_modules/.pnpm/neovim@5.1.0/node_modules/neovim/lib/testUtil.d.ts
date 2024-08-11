/// <reference types="node" />
import * as cp from 'node:child_process';
import { NeovimClient } from './api/client';
export declare function findNvimOrFail(): string;
export declare function startNvim(): [cp.ChildProcessWithoutNullStreams, NeovimClient];
export declare function startNvim(doAttach: false): [cp.ChildProcessWithoutNullStreams, undefined];
export declare function startNvim(doAttach: true): [cp.ChildProcessWithoutNullStreams, NeovimClient];
export declare function stopNvim(proc_?: cp.ChildProcessWithoutNullStreams | NeovimClient): void;
export declare function getFakeNvimClient(): NeovimClient;
