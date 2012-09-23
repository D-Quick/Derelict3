module derelict.lua.functions;

private {
	import derelict.lua.types;
}

extern(C) {
	//lua.h
	alias nothrow lua_State function(lua_Alloc f, void* ud) da_lua_newstate;
	alias nothrow void function(lua_State* L) da_lua_close;
	alias nothrow lua_CFunction function(lua_State* L, lua_CFunction panicf) da_lua_atpanic;
	alias nothrow const(lua_Number)* function(lua_State* L) da_lua_version;
	alias nothrow int function(lua_State* L, int idx) da_lua_absindex;
	alias nothrow int function(lua_State* L) da_lua_gettop;
	alias nothrow void function(lua_State* L, int idx) da_lua_settop;
	alias nothrow void function(lua_State* L, int idx) da_lua_pushvalue;
	alias nothrow void function(lua_State* L, int idx) da_lua_remove;
	alias nothrow void function(lua_State* L, int idx) da_lua_insert;
	alias nothrow void function(lua_State* L, int idx) da_lua_replace;
	alias nothrow void function(lua_State* L, int fromidx, int toidx) da_lua_copy;
	alias nothrow int function(lua_State* L, int sz) da_lua_checkstack;
	alias nothrow void function(lua_State* from, lua_State* to, int n) da_lua_xmove;
	alias nothrow int function(lua_State* L, int idx) da_lua_isnumber;
	alias nothrow int function(lua_State* L, int idx) da_lua_isstring;
	alias nothrow int function(lua_State* L, int idx) da_lua_iscfunction;
	alias nothrow int function(lua_State* L, int idx) da_lua_isuserdata;
	alias nothrow int function(lua_State* L, int idx) da_lua_type;
	alias nothrow const(char)* function(lua_State* L, int tp) da_lua_typename;
	alias nothrow lua_Number function(lua_State* L, int idx, int* isnum) da_lua_tonumberx;
	alias nothrow lua_Integer function(lua_State* L, int idx, int* isnum) da_lua_tointegerx;
	alias nothrow lua_Unsigned function(lua_State* L, int idx, int* isnum) da_lua_tounsignedx;
	alias nothrow int function(lua_State* L, int idx) da_lua_toboolean;
	alias nothrow const(char)* function(lua_State* L, int idx, size_t* len) da_lua_tolstring;
	alias nothrow size_t function(lua_State* L, int idx) da_lua_rawlen;
	alias nothrow lua_CFunction function(lua_State* L, int idx) da_lua_tocfunction;
	alias nothrow void* function(lua_State* L, int idx) da_lua_touserdata;
	alias nothrow lua_State* function(lua_State* L, int idx) da_lua_tothread;
	alias nothrow const(void)* function(lua_State* L, int idx) da_lua_topointer;
	alias nothrow void function(lua_State* L, int op) da_lua_arith;
	alias nothrow int function(lua_State* L, int idx1, int idx2) da_lua_rawequal;
	alias nothrow int function(lua_State* L, int idx1, int idx2, int op) da_lua_compare;
	alias nothrow void function(lua_State* L) da_lua_pushnil;
	alias nothrow void function(lua_State* L, lua_Number n) da_lua_pushnumber;
	alias nothrow void function(lua_State* L, lua_Integer n) da_lua_pushinteger;
	alias nothrow void function(lua_State* L, lua_Unsigned n) da_lua_pushunsigned;
	alias nothrow const(char)* function(lua_State* L, const(char)* s, size_t l) da_lua_pushlstring;
	alias nothrow const(char)* function(lua_State* L, const(char)* s) da_lua_pushstring;
	alias nothrow const(char)* function(lua_State* L, const(char)* fmt, va_list argp) da_lua_pushvfstring;
	alias nothrow const(char)* function(lua_State* L, const(char)* fmt, ...) da_lua_pushfstring;
	alias nothrow void function(lua_State* L, lua_CFunction fn, int n) da_lua_pushcclosure;
	alias nothrow void function(lua_State* L, int b) da_lua_pushboolean;
	alias nothrow void function(lua_State* L, void* p) da_lua_pushlightuserdata;
	alias nothrow void function(lua_State* L) da_lua_pushthread;
	alias nothrow void function(lua_State* L, const(char)* var) da_lua_getglobal;
	alias nothrow void function(lua_State* L, int idx) da_lua_gettable;
	alias nothrow void function(lua_State* L, int idx, const(char)* k) da_lua_getfield;
	alias nothrow void function(lua_State* L, int idx) da_lua_rawget;
	alias nothrow void function(lua_State* L, int idx, int n) da_lua_rawgeti;
	alias nothrow void function(lua_State* L, int idx, const(void)* p) da_lua_rawgetp;
	alias nothrow void function(lua_State* L, int narr, int nrec) da_lua_createtable;
	alias nothrow void* function(lua_State* L, size_t sz) da_lua_newuserdata;
	alias nothrow int function(lua_State* L, int objindex) da_lua_getmetatable;
	alias nothrow void function(lua_State* L, int idx) da_lua_getuservalue;
	alias nothrow void function(lua_State* L, const(char)* var) da_lua_setglobal;
	alias nothrow void function(lua_State* L, int idx) da_lua_settable;
	alias nothrow void function(lua_State* L, int idx, const(char)* k) da_lua_setfield;
	alias nothrow void function(lua_State* L, int idx) da_lua_rawset;
	alias nothrow void function(lua_State* L, int idx, int n) da_lua_rawseti;
	alias nothrow void function(lua_State* L, int idx, const(void)* p) da_lua_rawsetp;
	alias nothrow int function(lua_State* L, int objindex) da_lua_setmetatable;
	alias nothrow void function(lua_State* L, int idx) da_lua_setuservalue;
	alias nothrow void function(lua_State* L, int nargs, int nresults, int ctx, lua_CFunction k) da_lua_callk;
	alias nothrow int function(lua_State* L, int* ctx) da_lua_getctx;
	alias nothrow int function(lua_State* L, int nargs, int nresults, int errfunc, int ctx, lua_CFunction k) da_lua_pcallk;
	alias nothrow int function(lua_State* L, lua_Reader reader, void* dt, const(char)* chunkname, const(char)* mode) da_lua_load;
	alias nothrow int function(lua_State* L, lua_Writer writer, void* data) da_lua_dump;
	alias nothrow int function(lua_State* L, int nresults, int ctx, lua_CFunction k) da_lua_yieldk;
	alias nothrow int function(lua_State* L, lua_State* from, int narg) da_lua_resume;
	alias nothrow int function(lua_State* L) da_lua_status;
	alias nothrow int function(lua_State* L, int what, int data) da_lua_gc;
	alias nothrow int function(lua_State* L) da_lua_error;
	alias nothrow int function(lua_State* L, int idx) da_lua_next;
	alias nothrow void function(lua_State* L, int n) da_lua_concat;
	alias nothrow void function(lua_State* L, int idx) da_lua_len;
	alias nothrow lua_Alloc function(lua_State* L, void** ud) da_lua_getallocf;
	alias nothrow void function(lua_State* L, lua_Alloc f, void* ud) da_lua_setallocf;
	alias nothrow int function(lua_State* L, int level, lua_Debug* ar) da_lua_getstack;
	alias nothrow int function(lua_State* L, const char* what, lua_Debug* ar) da_lua_getinfo;
	alias nothrow const(char)* function(lua_State* L, const(lua_Debug)* ar, int n) da_lua_getlocal;
	alias nothrow const(char)* function(lua_State* L, const(lua_Debug)* ar, int n) da_lua_setlocal;
	alias nothrow const(char)* function(lua_State* L, int funcindex, int n) da_lua_getupvalue;
	alias nothrow const(char)* function(lua_State* L, int funcindex, int n) da_lua_setupvalue;
	alias nothrow void* function(lua_State* L, int fidx, int n) da_lua_upvalueid;
	alias nothrow void  function(lua_State* L, int fidx1, int n1, int fidx2, int n2) da_lua_upvaluejoin;
	alias nothrow int function(lua_State* L, lua_Hook func, int mask, int count) da_lua_sethook;
	alias nothrow lua_Hook function(lua_State* L) da_lua_gethook;
	alias nothrow int function(lua_State* L) da_lua_gethookmask;
	alias nothrow int function(lua_State* L) da_lua_gethookcount;
	
	//lauxlib.h
	alias nothrow void function(lua_State* L, lua_Number ver) da_luaL_checkversion_;
	alias nothrow int function(lua_State* L, int obj, const(char)* e) da_luaL_getmetafield;
	alias nothrow int function(lua_State* L, int obj, const(char)* e) da_luaL_callmeta;
	alias nothrow const(char)* function(lua_State* L, int idx, size_t* len) da_luaL_tolstring;
	alias nothrow int function(lua_State* L, int numarg, const(char)* extramsg) da_luaL_argerror;
	alias nothrow const(char)* function(lua_State* L, int numArg, size_t* l) da_luaL_checklstring;
	alias nothrow const(char)* function(lua_State* L, int numArg, const(char)* def, size_t* l) da_luaL_optlstring;
	alias nothrow lua_Number function(lua_State* L, int numArg) da_luaL_checknumber;
	alias nothrow lua_Number function(lua_State* L, int nArg, lua_Number def) da_luaL_optnumber;
	alias nothrow lua_Integer function(lua_State* L, int numArg) da_luaL_checkinteger;
	alias nothrow lua_Integer function(lua_State* L, int nArg, lua_Integer def) da_luaL_optinteger;
	alias nothrow lua_Unsigned function(lua_State* L, int numArg) da_luaL_checkunsigned;
	alias nothrow lua_Unsigned function(lua_State* L, int numArg, lua_Unsigned def) da_luaL_optunsigned;
	alias nothrow void function(lua_State* L, int sz, const(char)* msg) da_luaL_checkstack;
	alias nothrow void function(lua_State* L, int narg, int t) da_luaL_checktype;
	alias nothrow void function(lua_State* L, int narg) da_luaL_checkany;
	alias nothrow int function(lua_State* L, const(char)* tname) da_luaL_newmetatable;
	alias nothrow void function(lua_State* L, const(char)* tname) da_luaL_setmetatable;
	alias nothrow void* function(lua_State* L, int ud, const(char)* tname) da_luaL_testudata;
	alias nothrow void* function(lua_State* L, int ud, const(char)* tname) da_luaL_checkudata;
	alias nothrow void function(lua_State* L, int lvl) da_luaL_where;
	alias nothrow int function(lua_State* L, const(char)* fmt, ...) da_luaL_error;
	alias nothrow int function(lua_State* L, int narg, const(char)* def) da_luaL_checkoption;
	alias nothrow int function(lua_State* L, int stat, const(char)* fname) da_luaL_fileresult;
	alias nothrow int function(lua_State* L, int stat) da_luaL_execresult;
	alias nothrow int function(lua_State* L, int t) da_luaL_ref;
	alias nothrow void function(lua_State* L, int t, int re) da_luaL_unref;
	alias nothrow int function(lua_State* L, const(char)* filename, const(char)* mode) da_luaL_loadfilex;
	alias nothrow int function(lua_State* L, const(char)* buff, size_t sz, const(char)* name, const(char)* mode) da_luaL_loadbufferx;
	alias nothrow int function(lua_State* L, const(char)* s) da_luaL_loadstring;
	alias nothrow lua_State* function() da_luaL_newstate;
	alias nothrow int function(lua_State* L, int idx) da_luaL_len;
	alias nothrow const(char)* function(lua_State* L, const(char)* s, const(char)* p, const(char)* r) da_luaL_gsub;
	alias nothrow void function(lua_State* L, const luaL_Reg* l, int nup) da_luaL_setfuncs;
	alias nothrow int function(lua_State* L, int idx, const(char)* fname) da_luaL_getsubtable;
	alias nothrow void function(lua_State* L, lua_State* l1, const(char)* msg, int level) da_luaL_traceback;
	alias nothrow void function(lua_State* L, const(char)* modname, lua_CFunction openf, int glb) da_luaL_requiref;
	alias nothrow void function(lua_State* L, luaL_Buffer* B) da_luaL_buffinit;
	alias nothrow char* function(luaL_Buffer* B, size_t sz) da_luaL_prepbuffsize;
	alias nothrow void function(luaL_Buffer* B, const(char)* s, size_t l) da_luaL_addlstring;
	alias nothrow void function(luaL_Buffer* B, const(char)* s) da_luaL_addstring;
	alias nothrow void function(luaL_Buffer* B) da_luaL_addvalue;
	alias nothrow void function(luaL_Buffer* B) da_luaL_pushresult;
	alias nothrow void function(luaL_Buffer* B, size_t sz) da_luaL_pushresultsize;
	alias nothrow char* function(lua_State* L, luaL_Buffer* B, size_t sz) da_luaL_buffinitsize;
	alias nothrow void function(lua_State* L, const(char)* modname, int sizehint) da_luaL_pushmodule;
	alias nothrow void function(lua_State* L, const(char)* libname, const(luaL_Reg)* l, int nup) da_luaL_openlib;
	//lualib.h
	alias nothrow int function(lua_State *L) da_luaopen_base;
	alias nothrow int function(lua_State *L) da_luaopen_coroutine;
	alias nothrow int function(lua_State *L) da_luaopen_table;
	alias nothrow int function(lua_State *L) da_luaopen_io;
	alias nothrow int function(lua_State *L) da_luaopen_os;
	alias nothrow int function(lua_State *L) da_luaopen_string;
	alias nothrow int function(lua_State *L) da_luaopen_bit32;
	alias nothrow int function(lua_State *L) da_luaopen_math;
	alias nothrow int function(lua_State *L) da_luaopen_debug;
	alias nothrow int function(lua_State *L) da_luaopen_package;
	alias nothrow void function(lua_State *L) da_luaL_openlibs;
}

__gshared
{ 
	//lua.h
	da_lua_newstate lua_newstate;
	da_lua_close lua_close;
	da_lua_atpanic lua_atpanic;
	da_lua_version lua_version;
	da_lua_absindex lua_absindex;
	da_lua_gettop lua_gettop;
	da_lua_settop lua_settop;
	da_lua_pushvalue lua_pushvalue;
	da_lua_remove lua_remove;
	da_lua_insert lua_insert;
	da_lua_replace lua_replace;
	da_lua_copy lua_copy;
	da_lua_checkstack lua_checkstack;
	da_lua_xmove lua_xmove;
	da_lua_isnumber lua_isnumber;
	da_lua_isstring lua_isstring;
	da_lua_iscfunction lua_iscfunction;
	da_lua_isuserdata lua_isuserdata;
	da_lua_type lua_type;
	da_lua_typename lua_typename;
	da_lua_tonumberx lua_tonumberx;
	da_lua_tointegerx lua_tointegerx;
	da_lua_tounsignedx lua_tounsignedx;
	da_lua_toboolean lua_toboolean;
	da_lua_tolstring lua_tolstring;
	da_lua_rawlen lua_rawlen;
	da_lua_tocfunction lua_tocfunction;
	da_lua_touserdata lua_touserdata;
	da_lua_tothread lua_tothread;
	da_lua_topointer lua_topointer;
	da_lua_arith lua_arith;
	da_lua_rawequal lua_rawequal;
	da_lua_compare lua_compare;
	da_lua_pushnil lua_pushnil;
	da_lua_pushnumber lua_pushnumber;
	da_lua_pushinteger lua_pushinteger;
	da_lua_pushunsigned lua_pushunsigned;
	da_lua_pushlstring lua_pushlstring;
	da_lua_pushstring lua_pushstring;
	da_lua_pushvfstring lua_pushvfstring;
	da_lua_pushfstring lua_pushfstring;
	da_lua_pushcclosure lua_pushcclosure;
	da_lua_pushboolean lua_pushboolean;
	da_lua_pushlightuserdata lua_pushlightuserdata;
	da_lua_pushthread lua_pushthread;
	da_lua_getglobal lua_getglobal;
	da_lua_gettable lua_gettable;
	da_lua_getfield lua_getfield;
	da_lua_rawget lua_rawget;
	da_lua_rawgeti lua_rawgeti;
	da_lua_rawgetp lua_rawgetp;
	da_lua_createtable lua_createtable;
	da_lua_newuserdata lua_newuserdata;
	da_lua_getmetatable lua_getmetatable;
	da_lua_getuservalue lua_getuservalue;
	da_lua_setglobal lua_setglobal;
	da_lua_settable lua_settable;
	da_lua_setfield lua_setfield;
	da_lua_rawset lua_rawset;
	da_lua_rawseti lua_rawseti;
	da_lua_rawsetp lua_rawsetp;
	da_lua_setmetatable lua_setmetatable;
	da_lua_setuservalue lua_setuservalue;
	da_lua_callk lua_callk;
	da_lua_getctx lua_getctx;
	da_lua_pcallk lua_pcallk;
	da_lua_load lua_load;
	da_lua_dump lua_dump;
	da_lua_yieldk lua_yieldk;
	da_lua_resume lua_resume;
	da_lua_status lua_status;
	da_lua_error lua_error;
	da_lua_next lua_next;
	da_lua_concat lua_concat;
	da_lua_len lua_len;
	da_lua_getallocf lua_getallocf;
	da_lua_setallocf lua_setallocf;
	da_lua_getstack lua_getstack;
	da_lua_getinfo lua_getinfo;
	da_lua_getlocal lua_getlocal;
	da_lua_setlocal lua_setlocal;
	da_lua_getupvalue lua_getupvalue;
	da_lua_setupvalue lua_setupvalue;
	da_lua_upvalueid lua_upvalueid;
	da_lua_upvaluejoin lua_upvaluejoin;
	da_lua_sethook lua_sethook;
	da_lua_gethook lua_gethook;
	da_lua_gethookmask lua_gethookmask;
	da_lua_gethookcount lua_gethookcount;
	//lauxlib.h
	da_luaL_checkversion_ luaL_checkversion_;
	da_luaL_getmetafield luaL_getmetafield;
	da_luaL_callmeta luaL_callmeta;
	da_luaL_tolstring luaL_tolstring;
	da_luaL_argerror luaL_argerror;
	da_luaL_checklstring luaL_checklstring;
	da_luaL_optlstring luaL_optlstring;
	da_luaL_checknumber luaL_checknumber;
	da_luaL_optnumber luaL_optnumber;
	da_luaL_checkinteger luaL_checkinteger;
	da_luaL_optinteger luaL_optinteger;
	da_luaL_checkunsigned luaL_checkunsigned;
	da_luaL_optunsigned luaL_optunsigned;
	da_luaL_checkstack luaL_checkstack;
	da_luaL_checktype luaL_checktype;
	da_luaL_checkany luaL_checkany;
	da_luaL_newmetatable luaL_newmetatable;
	da_luaL_setmetatable luaL_setmetatable;
	da_luaL_testudata luaL_testudata;
	da_luaL_checkudata luaL_checkudata;
	da_luaL_where luaL_where;
	da_luaL_error luaL_error;
	da_luaL_checkoption luaL_checkoption;
	da_luaL_fileresult luaL_fileresult;
	da_luaL_execresult luaL_execresult;
	da_luaL_ref luaL_ref;
	da_luaL_unref luaL_unref;
	da_luaL_loadfilex luaL_loadfilex;
	da_luaL_loadbufferx luaL_loadbufferx;
	da_luaL_loadstring luaL_loadstring;
	da_luaL_newstate luaL_newstate;
	da_luaL_len luaL_len;
	da_luaL_gsub luaL_gsub;
	da_luaL_setfuncs luaL_setfuncs;
	da_luaL_getsubtable luaL_getsubtable;
	da_luaL_traceback luaL_traceback;
	da_luaL_requiref luaL_requiref;
	da_luaL_buffinit luaL_buffinit;
	da_luaL_prepbuffsize luaL_prepbuffsize;
	da_luaL_addlstring luaL_addlstring;
	da_luaL_addstring luaL_addstring;
	da_luaL_addvalue luaL_addvalue;
	da_luaL_pushresult luaL_pushresult;
	da_luaL_pushresultsize luaL_pushresultsize;
	da_luaL_buffinitsize luaL_buffinitsize;
	da_luaL_pushmodule luaL_pushmodule;
	da_luaL_openlib luaL_openlib;
	//lualib.h
	da_luaopen_base luaopen_base;
	da_luaopen_coroutine luaopen_coroutine;
	da_luaopen_table luaopen_table;
	da_luaopen_io luaopen_io;
	da_luaopen_os luaopen_os;
	da_luaopen_string luaopen_string;
	da_luaopen_bit32 luaopen_bit32;
	da_luaopen_math luaopen_math;
	da_luaopen_debug luaopen_debug;
	da_luaopen_package luaopen_package;
	da_luaL_openlibs luaL_openlibs;
}