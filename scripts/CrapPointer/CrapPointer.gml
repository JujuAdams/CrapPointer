/// Creates a crapPointer, expressed internally as an array
/// The scope argument should be set to a struct
/// 
/// @param scope
/// @param variableName

function CrapPointer(_scope, _variableName)
{
    if (!variable_struct_exists(_scope, _variableName))
    {
        show_error("Variable \"" + string(_variableName) + "\" doesn't exist in the given scope\n ", true);
    }
    
    return [(_scope == global)? _scope : weak_ref_create(_scope), _variableName, _scope[$ _variableName]];
}

show_debug_message("Welcome to CrapPointer by @jujuadams! This is version 1.0.0, 2022-10-09");
