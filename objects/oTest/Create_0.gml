try
{
    //This should throw an error since global.hello doesn't exist (yet)
    globalPointer1 = CrapPointer(global, "hello");
}
catch(_error)
{
    show_debug_message(_error);
}

global.hello = 10;
globalPointer1 = CrapPointer(global, "hello");
globalPointer2 = CrapPointer(global, "hello");



try
{
    //This should throw an error since self.hello doesn't exist (yet)
    instancePointer1 = CrapPointer(self, "hello");
}
catch(_error)
{
    show_debug_message(_error);
}

hello = 20;
instancePointer1 = CrapPointer(self, "hello");
instancePointer2 = CrapPointer(self, "hello");



struct = {};

try
{
    //This should throw an error since struct.hello doesn't exist (yet)
    structPointer1 = CrapPointer(struct, "hello");
}
catch(_error)
{
    show_debug_message(_error);
}

struct.hello = 30;
structPointer1 = CrapPointer(struct, "hello");
structPointer2 = CrapPointer(struct, "hello");
