# Functions That Should Not Exist

## Replacing ( - and _ ) in Variable Names with Spaces

```powershell
function Replace-DashesAndUnderscores {
    param (
        [string]$InputString
    )

    # Parse the input string into an AST
    $ast = [System.Management.Automation.Language.Parser]::ParseInput($InputString, [ref]$null, [ref]$null)

    # Find all function names in the AST
    $functionNames = $ast.FindAll({ 
        $args[0] -is [System.Management.Automation.Language.FunctionDefinitionAst]
    }, $true)

    # Replace '-' and '_' in function names with ' '
    foreach ($function in $functionNames) {
        $functionName = $function.Name
        $newFunctionName = $functionName -replace '[-_]', ' '
        $InputString = $InputString -replace [regex]::Escape($functionName), $newFunctionName
    }

    return $InputString
}
```

## Convert Switch Statement into Multiple If Statements

```powershell
** Code here
```

## Camel Case the Whole Script

```powershell
** Code here
```
