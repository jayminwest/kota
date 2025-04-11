# KOTA Template - Personal Knowledge Management with Aider

> **Tip:** Have questions about this repository or how to use KOTA? Just ask Aider! Use the `/ask` command followed by your question (e.g., `/ask How do I add a new project?`). Make sure the relevant files (like this README) are added to the chat first.

## Introduction

This repository provides a template for building a personal KOTA (Knowledge-Oriented Thinking Assistant) system using markdown files and the Aider command-line AI coding tool (`aider.chat`).

The goal is to create a personalized, distributed cognition partner that helps you think, learn, manage projects, and automate tasks by leveraging AI assistance directly within your knowledge base.

## Core Directories

*   **`core/`**: Contains fundamental documents defining your KOTA system's structure, principles, and goals.
*   **`personal/`**: Holds information about you (profile, goals, preferences) to provide context to Aider.
*   **`projects/`**: Stores individual project files, notes, tasks, and related information.
*   **`scripts/`**: Contains automation scripts (bash, python, etc.) that can interact with your KOTA system or perform other tasks.

## Getting Started with Aider

Aider is the primary interface for interacting with and evolving your KOTA system.

1.  **Install Aider:**
    ```bash
    pip install aider-chat
    ```
2.  **Configure API Key:** Ensure Aider is configured with your OpenAI API key (or another supported provider). Refer to Aider's documentation for details.
3.  **Run Aider:** Navigate to the root directory of this repository in your terminal and run:
    ```bash
    aider
    ```
4.  **Provide Context with `.aider.conf.yml`:** To make Aider aware of your core KOTA files, create a `.aider.conf.yml` file in the root directory. This tells Aider which files to load into its context automatically when it starts.

    **Example `.aider.conf.yml`:**
    ```yaml
    # .aider.conf.yml
    # Add files you want Aider to always be aware of.
    # Start with your core system files and personal profile.
    files:
      - core/knowledge-system.md
      - personal/profile.md
    # Add more files as your system grows!

    # Optional: Specify a model
    # model: gpt-4-turbo

    # Optional: Add Git settings
    # auto-commits: true
    # dirty-commits: false
    ```
    *Create this file in the root of your KOTA repository.*

## Extending KOTA with Integrations (MCP)

You can significantly enhance your KOTA system by integrating external tools and data sources using the Model Context Protocol (MCP). This allows KOTA (via scripts) to interact with APIs, databases, calendars, and more.

For detailed instructions on how to set up and use the `mcp-ts` client with your KOTA system, please refer to the guide:

*   **[[integrations/mcp/README.md]]**

## First Steps with Your KOTA

1.  **Fill Your Profile:** Start by thoroughly editing `personal/profile.md`. This gives Aider crucial context about you, your goals, and your preferences. Add this file to your `.aider.conf.yml`.
2.  **Customize Your System:** Review and customize `core/knowledge-system.md` to document your specific setup, principles, and how you intend to use KOTA. Add this file to your `.aider.conf.yml`.
3.  **Add Projects:** Create new markdown files in the `projects/` directory for your current initiatives. Use `projects/example-project.md` as a template.
4.  **Develop Scripts:** Add useful automation scripts to the `scripts/` directory.

## Disclaimer

This is a starting template. Adapt it freely to your individual needs, workflows, and thinking style. The power of KOTA lies in its personalization.
