/// @param crapPointer
/// @param value

function CrapPointerSet(_crapPointer, _value)
{
    var _scope        = _crapPointer[0];
    var _variableName = _crapPointer[1];
    
    if (_scope == global)
    {
        if (!variable_global_exists(_variableName)) return;
        variable_global_set(_variableName, _value);
    }
    else
    {
        _scope = _scope.ref;
        if (!weak_ref_alive(_scope) || !variable_struct_exists(_scope, _variableName)) return;
        _scope[$ _variableName] = _value;
    }
}
