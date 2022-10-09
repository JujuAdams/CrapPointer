/// @param crapPointer

function CrapPointerGetChanged(_crapPointer)
{
    var _scope = _crapPointer[0];
    if (_scope != global)
    {
        if (!weak_ref_alive(_scope)) return false;
        _scope = _scope.ref;
    }
    
    var _variableName = _crapPointer[1];
    var _newValue = _scope[$ _variableName];
    var _changed = (_scope[$ _variableName] != _crapPointer[2]);
    
    _crapPointer[@ 2] = _newValue;
    
    return _changed;
}
