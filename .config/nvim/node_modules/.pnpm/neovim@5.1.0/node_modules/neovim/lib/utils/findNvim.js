"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.exportsForTesting = exports.findNvim = void 0;
const node_child_process_1 = require("node:child_process");
const node_path_1 = require("node:path");
const node_fs_1 = require("node:fs");
const versionRegex = /^(\d+)\.(\d+)\.(\d+)(?:-(.+))?$/;
const nvimVersionRegex = /^NVIM\s+v(.+)$/m;
const buildTypeRegex = /^Build\s+type:\s+(.+)$/m;
const luaJitVersionRegex = /^LuaJIT\s+(.+)$/m;
const windows = process.platform === 'win32';
function parseVersion(version) {
    if (typeof version !== 'string') {
        throw new TypeError('Invalid version format: not a string');
    }
    const match = version.match(versionRegex);
    if (!match) {
        return undefined;
    }
    const [, major, minor, patch, prerelease] = match;
    const majorNumber = Number(major);
    const minorNumber = Number(minor);
    const patchNumber = Number(patch);
    const versionParts = [
        majorNumber,
        minorNumber,
        patchNumber,
    ];
    if (prerelease !== undefined) {
        versionParts.push(prerelease);
    }
    else {
        versionParts.push('zzz');
    }
    return versionParts;
}
/**
 * Compares two versions.
 * @param a - First version to compare.
 * @param b - Second version to compare.
 * @returns -1 if a < b, 0 if a == b, 1 if a > b.
 * @throws {TypeError} If the versions are not valid.
 *
 * Format could be:
 * - 0.9.1
 * - 0.10.0-dev-658+g06694203e-Homebrew
 */
function compareVersions(a, b) {
    const versionA = parseVersion(a);
    const versionB = parseVersion(b);
    const length = Math.min(versionA.length, versionB.length);
    for (let i = 0; i < length; i = i + 1) {
        const partA = versionA[i];
        const partB = versionB[i];
        if (partA < partB) {
            return -1;
        }
        if (partA > partB) {
            return 1;
        }
    }
    if (versionB.length > versionA.length) {
        return -1;
    }
    return 0;
}
/**
 * Tries to find a usable `nvim` binary on the current system.
 *
 * @param opt.minVersion See {@link FindNvimOptions.minVersion}
 * @param opt.orderBy See {@link FindNvimOptions.orderBy}
 */
function findNvim(opt = {}) {
    const paths = process.env.PATH.split(node_path_1.delimiter);
    const pathLength = paths.length;
    const matches = new Array();
    const invalid = new Array();
    for (let i = 0; i !== pathLength; i = i + 1) {
        const nvimPath = (0, node_path_1.join)(paths[i], windows ? 'nvim.exe' : 'nvim');
        if ((0, node_fs_1.existsSync)(nvimPath)) {
            try {
                (0, node_fs_1.accessSync)(nvimPath, node_fs_1.constants.X_OK);
                const nvimVersionFull = (0, node_child_process_1.execFileSync)(nvimPath, [
                    '--version',
                ]).toString();
                const nvimVersionMatch = nvimVersionRegex.exec(nvimVersionFull);
                const buildTypeMatch = buildTypeRegex.exec(nvimVersionFull);
                const luaJitVersionMatch = luaJitVersionRegex.exec(nvimVersionFull);
                if (nvimVersionMatch && buildTypeMatch && luaJitVersionMatch) {
                    if ('minVersion' in opt &&
                        compareVersions(opt.minVersion, nvimVersionMatch[1]) === 1) {
                        invalid.push({
                            nvimVersion: nvimVersionMatch[1],
                            path: nvimPath,
                            buildType: buildTypeMatch[1],
                            luaJitVersion: luaJitVersionMatch[1],
                        });
                    }
                    else {
                        matches.push({
                            nvimVersion: nvimVersionMatch[1],
                            path: nvimPath,
                            buildType: buildTypeMatch[1],
                            luaJitVersion: luaJitVersionMatch[1],
                        });
                    }
                }
            }
            catch (e) {
                invalid.push({
                    path: nvimPath,
                    error: e,
                });
            }
        }
    }
    if (opt.orderBy === undefined || opt.orderBy === 'desc') {
        matches.sort((a, b) => compareVersions(b.nvimVersion, a.nvimVersion));
    }
    return {
        matches,
        invalid,
    };
}
exports.findNvim = findNvim;
// jest sets NODE_ENV=test.
if (process.env.NODE_ENV === 'test') {
    // These functions are intentionally not exported. After `nvim` is found, clients can use Nvim's
    // own `vim.version` module, so node-client shouldn't expose a half-baked "semver" implementation.
    exports.exportsForTesting = {
        parseVersion,
        compareVersions,
    };
}
