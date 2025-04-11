# KOTA Integration: Model Context Protocol (MCP)

This guide explains how to integrate external tools and data sources into your KOTA system using the Model Context Protocol (MCP) and the `mcp-ts` client. MCP allows KOTA (via scripts or potentially Aider) to interact with APIs, databases, and other resources in a standardized way.

**Note:** This template provides instructions and examples. It does *not* include the `mcp-ts` client code itself to keep the template lightweight. You will set up the client separately.

## What is MCP?

MCP defines a standard way for AI models (like those used by Aider) or agents to discover and use external tools. An MCP "server" exposes specific functions (like `list_emails`, `query_database`, `get_weather`) that can be called with structured arguments.

## Setup Steps

1.  **Install Node.js and npm:** The `mcp-ts` client requires Node.js (LTS version recommended) and npm. Install them if you haven't already.

2.  **Get the `mcp-ts` Client Code:** You have two options:
    *   **Option A (Recommended): Clone Separately**
        *   Choose a location *outside* this KOTA repository to store MCP-related code (e.g., `~/dev/mcp-tools/`).
        *   Clone the client repository: `git clone https://github.com/your-org/mcp-ts.git path/to/mcp-client` (Replace URL if needed, and choose your path).
        *   This keeps your KOTA repo clean and focused on knowledge. Remember the path you chose for later steps.
    *   **Option B (Advanced): Clone Internally**
        *   You can clone the `mcp-ts` client *inside* this KOTA repo (e.g., into `core/mcp-ts/`).
        *   Run: `git clone https://github.com/your-org/mcp-ts.git core/mcp-ts` (Replace URL if needed).
        *   **Warning:** This adds Node.js project files (`node_modules`, `package.json`, etc.) to your KOTA repo, increasing complexity. Ensure `node_modules/` and build artifacts are in your main `.gitignore`.

3.  **Install Client Dependencies:**
    *   Navigate (`cd`) into the directory where you cloned `mcp-ts` (e.g., `cd path/to/mcp-client` or `cd core/mcp-ts`).
    *   Run: `npm install`

4.  **Build the Client:**
    *   In the same directory, run: `npm run build`

5.  **Configure Servers (`servers.json`):**
    *   Copy the example file `integrations/mcp/servers.example.json` from this template repo *into* your `mcp-ts` client directory (e.g., `path/to/mcp-client/servers.json` or `core/mcp-ts/servers.json`).
    *   Edit this new `servers.json` file. Define the MCP servers you want to use.
    *   For each server, provide a `nickname`, the `command` to run it (often `npx -y @some-org/mcp-server-package`), any necessary `args`, and potentially a `cwd` (working directory) if the server code is cloned elsewhere (e.g., into `~/dev/mcp-tools/servers/`).
    *   **Crucially:** Do *not* put API keys or secrets directly in `servers.json`. Use the `.env` file for that.

6.  **Configure Secrets (`.env`):**
    *   Copy the example file `integrations/mcp/.env.example` from this template repo *into* your `mcp-ts` client directory (e.g., `path/to/mcp-client/.env` or `core/mcp-ts/.env`).
    *   Edit this new `.env` file. Add the necessary API keys, tokens, or other secrets required by the MCP servers you configured in `servers.json`. Use the variable names expected by the specific MCP server packages.
    *   **Security:** Ensure this `.env` file is listed in the `.gitignore` file of your `mcp-ts` client directory *and* your main KOTA repository's `.gitignore` if you chose Option B.

## Using MCP Tools

The primary way to interact with MCP servers is via the `execute-tool` script provided by the `mcp-ts` client.

**Command Format:**

```bash
npm run execute-tool --prefix <path_to_client> <server_nickname> <tool_name> '[json_arguments]'
```

*   `--prefix <path_to_client>`: **Essential!** Tells `npm` where your `mcp-ts` client directory is located (e.g., `/path/to/mcp-client` or `./core/mcp-ts`).
*   `<server_nickname>`: The nickname you defined in your `servers.json` (e.g., `googleworkspace`, `github`).
*   `<tool_name>`: The exact name of the tool provided by the server (e.g., `list_emails`, `list_repos`). Use underscores (`_`).
*   `'[json_arguments]'`: A **single-quoted JSON string** containing the arguments for the tool. Use `{}` if the tool takes no arguments.

**Example Call (from a script or terminal):**

```bash
# Assuming mcp-ts is in /Users/me/dev/mcp-client
npm run execute-tool --prefix /Users/me/dev/mcp-client googleworkspace list_emails '{}'

# Example calling a tool that needs arguments
npm run execute-tool --prefix /Users/me/dev/mcp-client github list_repos '{"owner": "modelcontextprotocol"}'
```

**Output:**
*   **Success:** The command prints *only* the JSON result from the tool to standard output (stdout). Your script can parse this.
*   **Error:** Error messages go to standard error (stderr), and the command exits with a non-zero code.

## Integrating with KOTA/Aider

*   **Scripts:** Create scripts (like `scripts/mcp_example.sh`) that use the `execute-tool` command to perform specific actions. You can then potentially ask Aider to run these scripts (if Aider supports shell execution or you run them manually).
*   **Aider Context:** Add relevant MCP server outputs or summaries to your `core/conversation-notes.md` or project files to give Aider context obtained via MCP tools.

## Finding Servers and Tools

*   Refer to the documentation of the specific MCP server packages you install to find out what tools they offer and what arguments they expect.
*   You can use the `list-servers` and `list-tools` commands provided by `mcp-ts` for discovery:
    ```bash
    npm run list-servers --prefix <path_to_client>
    npm run list-tools --prefix <path_to_client> <server_nickname>
    ```

By following these steps, you can extend your KOTA system with powerful external capabilities via MCP.
