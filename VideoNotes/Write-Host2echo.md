        $writeHostCommands = $ast.FindAll({
                param($node)
                $node -is [System.Management.Automation.Language.CommandAst] -and
                $node.GetCommandName() -eq 'Write-Host'
        }, $true)

        # Replace each Write-Host with echo, keeping the first argument
        foreach ($command in $writeHostCommands) {
                $commandExtent = $command.Extent
                $commandText = $commandExtent.Text

                # Extract the first argument (if exists)
                $firstArgument = $command.CommandElements[1].Extent.Text -replace '^\s+', ''  # Remove leading whitespace

                # Create the echo command with the first argument
                $echoCommand = "echo $firstArgument"

                # Replace the command text with 'echo' and first argument
                $scriptContent = $scriptContent.Replace($commandText, $echoCommand)
        }
