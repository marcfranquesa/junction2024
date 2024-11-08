
// this file is generated — do not edit it


/// <reference types="@sveltejs/kit" />

/**
 * Environment variables [loaded by Vite](https://vitejs.dev/guide/env-and-mode.html#env-files) from `.env` files and `process.env`. Like [`$env/dynamic/private`](https://svelte.dev/docs/kit/$env-dynamic-private), this module cannot be imported into client-side code. This module only includes variables that _do not_ begin with [`config.kit.env.publicPrefix`](https://svelte.dev/docs/kit/configuration#env) _and do_ start with [`config.kit.env.privatePrefix`](https://svelte.dev/docs/kit/configuration#env) (if configured).
 * 
 * _Unlike_ [`$env/dynamic/private`](https://svelte.dev/docs/kit/$env-dynamic-private), the values exported from this module are statically injected into your bundle at build time, enabling optimisations like dead code elimination.
 * 
 * ```ts
 * import { API_KEY } from '$env/static/private';
 * ```
 * 
 * Note that all environment variables referenced in your code should be declared (for example in an `.env` file), even if they don't have a value until the app is deployed:
 * 
 * ```
 * MY_FEATURE_FLAG=""
 * ```
 * 
 * You can override `.env` values from the command line like so:
 * 
 * ```bash
 * MY_FEATURE_FLAG="enabled" npm run dev
 * ```
 */
declare module '$env/static/private' {
	export const NPM_CONFIG_USERCONFIG: string;
	export const XDG_DOWNLOAD_DIR: string;
	export const TERM_PROGRAM: string;
	export const NODE: string;
	export const XDG_DATA_HOME: string;
	export const INIT_CWD: string;
	export const PYENV_ROOT: string;
	export const TERM: string;
	export const SHELL: string;
	export const CLICOLOR: string;
	export const TMPDIR: string;
	export const HOMEBREW_REPOSITORY: string;
	export const npm_config_global_prefix: string;
	export const SQLITE_HISTORY: string;
	export const TERM_PROGRAM_VERSION: string;
	export const WINDOWID: string;
	export const ZDOTDIR: string;
	export const COLOR: string;
	export const npm_config_noproxy: string;
	export const npm_config_local_prefix: string;
	export const PYTHONUSERBASE: string;
	export const USER: string;
	export const PYTHONPYCACHEPREFIX: string;
	export const COMMAND_MODE: string;
	export const ALACRITTY_SOCKET: string;
	export const npm_config_globalconfig: string;
	export const SSH_AUTH_SOCK: string;
	export const ALACRITTY_LOG: string;
	export const __CF_USER_TEXT_ENCODING: string;
	export const npm_execpath: string;
	export const TMUX: string;
	export const LSCOLORS: string;
	export const PATH: string;
	export const CARGO_HOME: string;
	export const npm_package_json: string;
	export const npm_config_engine_strict: string;
	export const _: string;
	export const npm_config_init_module: string;
	export const __CFBundleIdentifier: string;
	export const POETRY_CONFIG_DIR: string;
	export const npm_command: string;
	export const PWD: string;
	export const DOCKER_CONFIG: string;
	export const XDG_DESKTOP_DIR: string;
	export const DBUS_LAUNCHD_SESSION_BUS_SOCKET: string;
	export const npm_lifecycle_event: string;
	export const EDITOR: string;
	export const npm_package_name: string;
	export const IPYTHONDIR: string;
	export const XDG_STATE_HOME: string;
	export const KEYTIMEOUT: string;
	export const npm_config_npm_version: string;
	export const XPC_FLAGS: string;
	export const TMUX_PANE: string;
	export const JUPYTER_CONFIG_DIR: string;
	export const npm_config_node_gyp: string;
	export const npm_package_version: string;
	export const XPC_SERVICE_NAME: string;
	export const SHLVL: string;
	export const PYENV_SHELL: string;
	export const HOME: string;
	export const XDG_CONFIG_HOME: string;
	export const SHELL_SESSIONS_DISABLE: string;
	export const HOMEBREW_PREFIX: string;
	export const RUSTUP_HOME: string;
	export const XDG_CACHE_HOME: string;
	export const npm_config_cache: string;
	export const LOGNAME: string;
	export const npm_lifecycle_script: string;
	export const ALACRITTY_WINDOW_ID: string;
	export const NODE_REPL_HISTORY: string;
	export const LC_CTYPE: string;
	export const DBUS_SESSION_BUS_ADDRESS: string;
	export const GOPATH: string;
	export const npm_config_user_agent: string;
	export const INFOPATH: string;
	export const HOMEBREW_CELLAR: string;
	export const POETRY_DATA_DIR: string;
	export const TEXMFHOME: string;
	export const PYTHON_HISTORY: string;
	export const POETRY_CACHE_DIR: string;
	export const R_LIBS_USER: string;
	export const HISTFILE: string;
	export const npm_node_execpath: string;
	export const npm_config_prefix: string;
	export const COLORTERM: string;
	export const NODE_ENV: string;
}

/**
 * Similar to [`$env/static/private`](https://svelte.dev/docs/kit/$env-static-private), except that it only includes environment variables that begin with [`config.kit.env.publicPrefix`](https://svelte.dev/docs/kit/configuration#env) (which defaults to `PUBLIC_`), and can therefore safely be exposed to client-side code.
 * 
 * Values are replaced statically at build time.
 * 
 * ```ts
 * import { PUBLIC_BASE_URL } from '$env/static/public';
 * ```
 */
declare module '$env/static/public' {
	
}

/**
 * This module provides access to runtime environment variables, as defined by the platform you're running on. For example if you're using [`adapter-node`](https://github.com/sveltejs/kit/tree/main/packages/adapter-node) (or running [`vite preview`](https://svelte.dev/docs/kit/cli)), this is equivalent to `process.env`. This module only includes variables that _do not_ begin with [`config.kit.env.publicPrefix`](https://svelte.dev/docs/kit/configuration#env) _and do_ start with [`config.kit.env.privatePrefix`](https://svelte.dev/docs/kit/configuration#env) (if configured).
 * 
 * This module cannot be imported into client-side code.
 * 
 * Dynamic environment variables cannot be used during prerendering.
 * 
 * ```ts
 * import { env } from '$env/dynamic/private';
 * console.log(env.DEPLOYMENT_SPECIFIC_VARIABLE);
 * ```
 * 
 * > In `dev`, `$env/dynamic` always includes environment variables from `.env`. In `prod`, this behavior will depend on your adapter.
 */
declare module '$env/dynamic/private' {
	export const env: {
		NPM_CONFIG_USERCONFIG: string;
		XDG_DOWNLOAD_DIR: string;
		TERM_PROGRAM: string;
		NODE: string;
		XDG_DATA_HOME: string;
		INIT_CWD: string;
		PYENV_ROOT: string;
		TERM: string;
		SHELL: string;
		CLICOLOR: string;
		TMPDIR: string;
		HOMEBREW_REPOSITORY: string;
		npm_config_global_prefix: string;
		SQLITE_HISTORY: string;
		TERM_PROGRAM_VERSION: string;
		WINDOWID: string;
		ZDOTDIR: string;
		COLOR: string;
		npm_config_noproxy: string;
		npm_config_local_prefix: string;
		PYTHONUSERBASE: string;
		USER: string;
		PYTHONPYCACHEPREFIX: string;
		COMMAND_MODE: string;
		ALACRITTY_SOCKET: string;
		npm_config_globalconfig: string;
		SSH_AUTH_SOCK: string;
		ALACRITTY_LOG: string;
		__CF_USER_TEXT_ENCODING: string;
		npm_execpath: string;
		TMUX: string;
		LSCOLORS: string;
		PATH: string;
		CARGO_HOME: string;
		npm_package_json: string;
		npm_config_engine_strict: string;
		_: string;
		npm_config_init_module: string;
		__CFBundleIdentifier: string;
		POETRY_CONFIG_DIR: string;
		npm_command: string;
		PWD: string;
		DOCKER_CONFIG: string;
		XDG_DESKTOP_DIR: string;
		DBUS_LAUNCHD_SESSION_BUS_SOCKET: string;
		npm_lifecycle_event: string;
		EDITOR: string;
		npm_package_name: string;
		IPYTHONDIR: string;
		XDG_STATE_HOME: string;
		KEYTIMEOUT: string;
		npm_config_npm_version: string;
		XPC_FLAGS: string;
		TMUX_PANE: string;
		JUPYTER_CONFIG_DIR: string;
		npm_config_node_gyp: string;
		npm_package_version: string;
		XPC_SERVICE_NAME: string;
		SHLVL: string;
		PYENV_SHELL: string;
		HOME: string;
		XDG_CONFIG_HOME: string;
		SHELL_SESSIONS_DISABLE: string;
		HOMEBREW_PREFIX: string;
		RUSTUP_HOME: string;
		XDG_CACHE_HOME: string;
		npm_config_cache: string;
		LOGNAME: string;
		npm_lifecycle_script: string;
		ALACRITTY_WINDOW_ID: string;
		NODE_REPL_HISTORY: string;
		LC_CTYPE: string;
		DBUS_SESSION_BUS_ADDRESS: string;
		GOPATH: string;
		npm_config_user_agent: string;
		INFOPATH: string;
		HOMEBREW_CELLAR: string;
		POETRY_DATA_DIR: string;
		TEXMFHOME: string;
		PYTHON_HISTORY: string;
		POETRY_CACHE_DIR: string;
		R_LIBS_USER: string;
		HISTFILE: string;
		npm_node_execpath: string;
		npm_config_prefix: string;
		COLORTERM: string;
		NODE_ENV: string;
		[key: `PUBLIC_${string}`]: undefined;
		[key: `${string}`]: string | undefined;
	}
}

/**
 * Similar to [`$env/dynamic/private`](https://svelte.dev/docs/kit/$env-dynamic-private), but only includes variables that begin with [`config.kit.env.publicPrefix`](https://svelte.dev/docs/kit/configuration#env) (which defaults to `PUBLIC_`), and can therefore safely be exposed to client-side code.
 * 
 * Note that public dynamic environment variables must all be sent from the server to the client, causing larger network requests — when possible, use `$env/static/public` instead.
 * 
 * Dynamic environment variables cannot be used during prerendering.
 * 
 * ```ts
 * import { env } from '$env/dynamic/public';
 * console.log(env.PUBLIC_DEPLOYMENT_SPECIFIC_VARIABLE);
 * ```
 */
declare module '$env/dynamic/public' {
	export const env: {
		[key: `PUBLIC_${string}`]: string | undefined;
	}
}
