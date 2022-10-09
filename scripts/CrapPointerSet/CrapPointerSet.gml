/// @param crapPointer
/// @param value

function CrapPointerSet(_crapPointer, _value)
{
    var _scope = _crapPointer[0];
    if (_scope == global)
    {
        _scope[$ _crapPointer[1]] = _value;
    }
    else
    {
        if (!weak_ref_alive(_scope)) return;
        _scope.ref[$ _crapPointer[1]] = _value;
    }
}
