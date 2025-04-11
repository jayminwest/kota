#!/bin/bash                                                                                     
# Make sure this script is executable (chmod +x mcp_example.sh)                                 
                                                                                                
# Example script showing how to call an MCP tool using the mcp-ts client.                       
# IMPORTANT: You must configure the MCP_CLIENT_DIR variable below.                              
                                                                                                
# --- Configuration ---                                                                         
# Option 1: If you cloned mcp-ts *outside* this repo (Recommended)                              
# Replace "/path/to/your/mcp-ts/client" with the actual absolute path.                          
MCP_CLIENT_DIR="/path/to/your/mcp-ts/client"                                                    
                                                                                                
# Option 2: If you cloned mcp-ts *inside* this repo (e.g., into core/mcp-ts)                    
# MCP_CLIENT_DIR="./core/mcp-ts" # Adjust path as needed                                        
                                                                                                
# --- Script Logic ---                                                                          
# Check if MCP client directory exists                                                          
if [ ! -d "$MCP_CLIENT_DIR" ] || [ ! -f "$MCP_CLIENT_DIR/package.json" ]; then                  
  echo "Error: MCP Client directory not found or invalid: $MCP_CLIENT_DIR" >&2                  
  echo "Please configure the MCP_CLIENT_DIR variable in this script." >&2                       
  exit 1                                                                                        
fi                                                                                              
                                                                                                
# Example Call Parameters (Modify as needed)                                                    
SERVER_NICKNAME="googleworkspace" # Replace with the server nickname from your servers.json     
TOOL_NAME="list_emails"           # Replace with the tool name you want to run                  
JSON_ARGS='{}'                    # Replace with JSON arguments for the tool (use '{}' for none)
                                                                                                
echo "Attempting to call MCP tool:"                                                             
echo "  Client Dir: $MCP_CLIENT_DIR"                                                            
echo "  Server:     $SERVER_NICKNAME"                                                           
echo "  Tool:       $TOOL_NAME"                                                                 
echo "  Arguments:  $JSON_ARGS"                                                                 
echo "---"                                                                                      
                                                                                                
# Execute the tool using npm run execute-tool                                                   
npm run execute-tool --prefix "$MCP_CLIENT_DIR" "$SERVER_NICKNAME" "$TOOL_NAME" "$JSON_ARGS"    
                                                                                                
# Check the exit code                                                                           
EXIT_CODE=$?                                                                                    
if [ $EXIT_CODE -ne 0 ]; then                                                                   
  echo "---" >&2                                                                                
  echo "Error: MCP tool execution failed with exit code $EXIT_CODE." >&2                        
  exit 1                                                                                        
fi                                                                                              
                                                                                                
echo "---"                                                                                      
echo "MCP tool execution successful."                                                           
exit 0  