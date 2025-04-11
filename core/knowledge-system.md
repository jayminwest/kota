# My KOTA System Documentation

## Introduction

This file documents the structure, principles, and goals of my personal KOTA implementation. It helps both me and Aider understand how my system works.

## Core Principles

(Placeholder section: "List the guiding principles for your knowledge system. Examples: Simplicity, Action-Oriented, Privacy-First, Connection-Focused.")

## Directory Structure

(Placeholder section: "Describe your main directories and their purpose. You can use a simple list or a tree structure.")

## Key Files & Purpose

(Placeholder section: "List your most important files and what they contain. Link to them using markdown links.")
*   `[[../personal/profile.md]]`: Core personal context.
*   `[[../personal/cognitive-profile.md]]`: Detailed thinking and learning style.
*   `[[conversation-notes.md]]`: Record of interactions and decisions.
*   *(Add others as you create them)*

## Workflow

(Placeholder section: "Describe how you typically interact with your KOTA system using Aider.")

## Integrations

### Model Context Protocol (MCP)

This KOTA system can be extended to interact with external tools and data sources using the Model Context Protocol (MCP). This requires setting up the `mcp-ts` client separately.

*   **Setup Guide:** See `[[../integrations/mcp/README.md]]`
*   **Usage:** MCP tools are typically invoked via scripts stored in the `scripts/` directory (see `[[../scripts/mcp_example.sh]]`). These scripts use the `npm run execute-tool` command provided by the `mcp-ts` client. The output from these tools can then be manually added to relevant notes or potentially processed further by Aider.
