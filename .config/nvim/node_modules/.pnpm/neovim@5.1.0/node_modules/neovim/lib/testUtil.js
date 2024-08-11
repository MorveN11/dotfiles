"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getFakeNvimClient = exports.stopNvim = exports.startNvim = exports.findNvimOrFail = void 0;
const cp = __importStar(require("node:child_process"));
// eslint-disable-next-line import/no-extraneous-dependencies
const jest = __importStar(require("@jest/globals"));
const fs = __importStar(require("node:fs"));
const path = __importStar(require("node:path"));
const client_1 = require("./api/client");
const attach_1 = require("./attach");
const findNvim_1 = require("./utils/findNvim");
const logger_1 = require("./utils/logger");
function findNvimOrFail() {
    const minVersion = '0.9.5';
    const found = (0, findNvim_1.findNvim)({ minVersion });
    if (found.matches.length === 0) {
        throw new Error(`nvim ${minVersion} not found`);
    }
    return found.matches[0].path;
}
exports.findNvimOrFail = findNvimOrFail;
const nvimPath = findNvimOrFail();
let proc;
let nvim;
function startNvim(doAttach = true) {
    var _a;
    const testFile = (_a = jest.expect.getState().testPath) === null || _a === void 0 ? void 0 : _a.replace(/.*[\\/]/, '');
    const msg = `startNvim in test: ${testFile}`;
    if (process.env.NVIM_NODE_LOG_FILE) {
        const logfile = path.resolve(process.env.NVIM_NODE_LOG_FILE);
        fs.writeFileSync(logfile, `${msg}\n`, { flag: 'a' });
    }
    proc = cp.spawn(nvimPath, ['-u', 'NONE', '--embed', '-n', '--noplugin'], {
        cwd: __dirname,
    });
    if (!doAttach) {
        return [proc, undefined];
    }
    nvim = (0, attach_1.attach)({ proc });
    return [proc, nvim];
}
exports.startNvim = startNvim;
function stopNvim(proc_) {
    // Stop all (proc + client).
    if (!proc_) {
        if (proc) {
            stopNvim(proc);
        }
        if (nvim) {
            stopNvim(nvim);
        }
        return;
    }
    if (proc_ instanceof client_1.NeovimClient) {
        proc_.quit();
    }
    else if (proc_ && proc_.connected) {
        proc_.disconnect();
    }
}
exports.stopNvim = stopNvim;
function getFakeNvimClient() {
    return {
        logger: (0, logger_1.getLogger)(),
    };
}
exports.getFakeNvimClient = getFakeNvimClient;
// jest.beforeAll(async () => {
//   [proc, nvim] = startNvim();
// });
// jest.afterAll(() => {
//   stopNvim();
// });
