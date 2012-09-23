module derelict.lua.lua;

public {
	import derelict.lua.functions;
	import derelict.lua.types;
	import derelict.lua.macros;
}

private {
	import derelict.util.loader;
    import derelict.util.system;
	
	static if(Derelict_OS_Windows)
    {
        enum libNames = "lua52.dll";
    }
	else static if(Derelict_OS_Mac)
    {
        enum libNames = "liblua52.a";
    }
    else static if(Derelict_OS_Posix)
    {
        enum libNames = "liblua52.a";
    }
    else
        static assert(0, "Need to implement lua libNames for this operating system.");
}

class DerelictLuaLoader : SharedLibLoader
{
    protected
    {
        override void loadSymbols()
        {
			//lua.h
			bindFunc(cast(void**)&lua_newstate, "lua_newstate");
			bindFunc(cast(void**)&lua_close, "lua_close");
			bindFunc(cast(void**)&lua_atpanic, "lua_atpanic");
			bindFunc(cast(void**)&lua_version, "lua_version");
			bindFunc(cast(void**)&lua_absindex, "lua_absindex");
			bindFunc(cast(void**)&lua_gettop, "lua_gettop");
			bindFunc(cast(void**)&lua_settop, "lua_settop");
			bindFunc(cast(void**)&lua_pushvalue, "lua_pushvalue");
			bindFunc(cast(void**)&lua_remove, "lua_remove");
			bindFunc(cast(void**)&lua_insert, "lua_insert");
			bindFunc(cast(void**)&lua_replace, "lua_replace");
			bindFunc(cast(void**)&lua_copy, "lua_copy");
			bindFunc(cast(void**)&lua_checkstack, "lua_checkstack");
			bindFunc(cast(void**)&lua_xmove, "lua_xmove");
			bindFunc(cast(void**)&lua_isnumber, "lua_isnumber");
			bindFunc(cast(void**)&lua_isstring, "lua_isstring");
			bindFunc(cast(void**)&lua_iscfunction, "lua_iscfunction");
			bindFunc(cast(void**)&lua_isuserdata, "lua_isuserdata");
			bindFunc(cast(void**)&lua_type, "lua_type");
			bindFunc(cast(void**)&lua_typename, "lua_typename");
			bindFunc(cast(void**)&lua_typename, "lua_typename");
			bindFunc(cast(void**)&lua_tonumberx, "lua_tonumberx");
			bindFunc(cast(void**)&lua_tointegerx, "lua_tointegerx");
			bindFunc(cast(void**)&lua_tounsignedx, "lua_tounsignedx");
			bindFunc(cast(void**)&lua_toboolean, "lua_toboolean");
			bindFunc(cast(void**)&lua_tolstring, "lua_tolstring");
			bindFunc(cast(void**)&lua_rawlen, "lua_rawlen");
			bindFunc(cast(void**)&lua_tocfunction, "lua_tocfunction");
			bindFunc(cast(void**)&lua_touserdata, "lua_touserdata");
			bindFunc(cast(void**)&lua_tothread, "lua_tothread");
			bindFunc(cast(void**)&lua_topointer, "lua_topointer");	
			bindFunc(cast(void**)&lua_arith, "lua_arith");
			bindFunc(cast(void**)&lua_rawequal, "lua_rawequal");
			bindFunc(cast(void**)&lua_compare, "lua_compare");	
			bindFunc(cast(void**)&lua_pushnil, "lua_pushnil");	
			bindFunc(cast(void**)&lua_pushnumber, "lua_pushnumber");	
			bindFunc(cast(void**)&lua_pushinteger, "lua_pushinteger");	
			bindFunc(cast(void**)&lua_pushunsigned, "lua_pushunsigned");	
			bindFunc(cast(void**)&lua_pushlstring, "lua_pushlstring");	
			bindFunc(cast(void**)&lua_pushstring, "lua_pushstring");	
			bindFunc(cast(void**)&lua_pushvfstring, "lua_pushvfstring");	
			bindFunc(cast(void**)&lua_pushfstring, "lua_pushfstring");	
			bindFunc(cast(void**)&lua_pushcclosure, "lua_pushcclosure");	
			bindFunc(cast(void**)&lua_pushboolean, "lua_pushboolean");	
			bindFunc(cast(void**)&lua_pushlightuserdata, "lua_pushlightuserdata");	
			bindFunc(cast(void**)&lua_pushthread, "lua_pushthread");		
			bindFunc(cast(void**)&lua_getglobal, "lua_getglobal");		
			bindFunc(cast(void**)&lua_gettable, "lua_gettable");		
			bindFunc(cast(void**)&lua_getfield, "lua_getfield");		
			bindFunc(cast(void**)&lua_rawget, "lua_rawget");		
			bindFunc(cast(void**)&lua_rawgeti, "lua_rawgeti");		
			bindFunc(cast(void**)&lua_rawgetp, "lua_rawgetp");		
			bindFunc(cast(void**)&lua_createtable, "lua_createtable");		
			bindFunc(cast(void**)&lua_newuserdata, "lua_newuserdata");		
			bindFunc(cast(void**)&lua_getmetatable, "lua_getmetatable");		
			bindFunc(cast(void**)&lua_setglobal, "lua_setglobal");				
			bindFunc(cast(void**)&lua_settable, "lua_settable");				
			bindFunc(cast(void**)&lua_setfield, "lua_setfield");				
			bindFunc(cast(void**)&lua_rawset, "lua_rawset");				
			bindFunc(cast(void**)&lua_rawseti, "lua_rawseti");				
			bindFunc(cast(void**)&lua_rawsetp, "lua_rawsetp");				
			bindFunc(cast(void**)&lua_setmetatable, "lua_setmetatable");				
			bindFunc(cast(void**)&lua_setuservalue, "lua_setuservalue");								
			bindFunc(cast(void**)&lua_callk, "lua_callk");								
			bindFunc(cast(void**)&lua_getctx, "lua_getctx");								
			bindFunc(cast(void**)&lua_pcallk, "lua_pcallk");								
			bindFunc(cast(void**)&lua_load, "lua_load");								
			bindFunc(cast(void**)&lua_dump, "lua_dump");								
			bindFunc(cast(void**)&lua_yieldk, "lua_yieldk");								
			bindFunc(cast(void**)&lua_resume, "lua_resume");								
			bindFunc(cast(void**)&lua_status, "lua_status");								
			bindFunc(cast(void**)&lua_error, "lua_error");								
			bindFunc(cast(void**)&lua_next, "lua_next");								
			bindFunc(cast(void**)&lua_concat, "lua_concat");								
			bindFunc(cast(void**)&lua_len, "lua_len");								
			bindFunc(cast(void**)&lua_getallocf, "lua_getallocf");								
			bindFunc(cast(void**)&lua_getstack, "lua_getstack");								
			bindFunc(cast(void**)&lua_getinfo, "lua_getinfo");								
			bindFunc(cast(void**)&lua_getlocal, "lua_getlocal");								
			bindFunc(cast(void**)&lua_setlocal, "lua_setlocal");								
			bindFunc(cast(void**)&lua_getupvalue, "lua_getupvalue");								
			bindFunc(cast(void**)&lua_setupvalue, "lua_setupvalue");								
			bindFunc(cast(void**)&lua_upvalueid, "lua_upvalueid");								
			bindFunc(cast(void**)&lua_upvaluejoin, "lua_upvaluejoin");								
			bindFunc(cast(void**)&lua_sethook, "lua_sethook");								
			bindFunc(cast(void**)&lua_gethook, "lua_gethook");								
			bindFunc(cast(void**)&lua_gethookmask, "lua_gethookmask");								
			bindFunc(cast(void**)&lua_gethookcount, "lua_gethookcount");							
			//lauxlib.h
			bindFunc(cast(void**)&luaL_checkversion_, "luaL_checkversion_");
			bindFunc(cast(void**)&luaL_getmetafield, "luaL_getmetafield");
			bindFunc(cast(void**)&luaL_callmeta, "luaL_callmeta");
			bindFunc(cast(void**)&luaL_tolstring, "luaL_tolstring");
			bindFunc(cast(void**)&luaL_argerror, "luaL_argerror");
			bindFunc(cast(void**)&luaL_checklstring, "luaL_checklstring");
			bindFunc(cast(void**)&luaL_optlstring, "luaL_optlstring");
			bindFunc(cast(void**)&luaL_checknumber, "luaL_checknumber");
			bindFunc(cast(void**)&luaL_optnumber, "luaL_optnumber");
			bindFunc(cast(void**)&luaL_checkinteger, "luaL_checkinteger");
			bindFunc(cast(void**)&luaL_optinteger, "luaL_optinteger");
			bindFunc(cast(void**)&luaL_checkunsigned, "luaL_checkunsigned");
			bindFunc(cast(void**)&luaL_optunsigned, "luaL_optunsigned");
			bindFunc(cast(void**)&luaL_checkstack, "luaL_checkstack");
			bindFunc(cast(void**)&luaL_checktype, "luaL_checktype");
			bindFunc(cast(void**)&luaL_checkany, "luaL_checkany");
			bindFunc(cast(void**)&luaL_newmetatable, "luaL_newmetatable");
			bindFunc(cast(void**)&luaL_setmetatable, "luaL_setmetatable");
			bindFunc(cast(void**)&luaL_testudata, "luaL_testudata");
			bindFunc(cast(void**)&luaL_checkudata, "luaL_checkudata");
			bindFunc(cast(void**)&luaL_where, "luaL_where");
			bindFunc(cast(void**)&luaL_error, "luaL_error");
			bindFunc(cast(void**)&luaL_checkoption, "luaL_checkoption");
			bindFunc(cast(void**)&luaL_fileresult, "luaL_fileresult");
			bindFunc(cast(void**)&luaL_execresult, "luaL_execresult");
			bindFunc(cast(void**)&luaL_ref, "luaL_ref");
			bindFunc(cast(void**)&luaL_unref, "luaL_unref");
			bindFunc(cast(void**)&luaL_loadfilex, "luaL_loadfilex");
			bindFunc(cast(void**)&luaL_loadbufferx, "luaL_loadbufferx");
			bindFunc(cast(void**)&luaL_loadstring, "luaL_loadstring");
			bindFunc(cast(void**)&luaL_newstate, "luaL_newstate");
			bindFunc(cast(void**)&luaL_len, "luaL_len");
			bindFunc(cast(void**)&luaL_gsub, "luaL_gsub");
			bindFunc(cast(void**)&luaL_setfuncs, "luaL_setfuncs");
			bindFunc(cast(void**)&luaL_getsubtable, "luaL_getsubtable");
			bindFunc(cast(void**)&luaL_traceback, "luaL_traceback");
			bindFunc(cast(void**)&luaL_requiref, "luaL_requiref");
			bindFunc(cast(void**)&luaL_buffinit, "luaL_buffinit");
			bindFunc(cast(void**)&luaL_prepbuffsize, "luaL_prepbuffsize");
			bindFunc(cast(void**)&luaL_addlstring, "luaL_addlstring");
			bindFunc(cast(void**)&luaL_addstring, "luaL_addstring");
			bindFunc(cast(void**)&luaL_addvalue, "luaL_addvalue");
			bindFunc(cast(void**)&luaL_pushresult, "luaL_pushresult");
			bindFunc(cast(void**)&luaL_pushresultsize, "luaL_pushresultsize");
			bindFunc(cast(void**)&luaL_buffinitsize, "luaL_buffinitsize");
			bindFunc(cast(void**)&luaL_pushmodule, "luaL_pushmodule");
			bindFunc(cast(void**)&luaL_openlib, "luaL_openlib");
			//lualib.h
			bindFunc(cast(void**)&luaopen_base, "luaopen_base");
			bindFunc(cast(void**)&luaopen_coroutine, "luaopen_coroutine");
			bindFunc(cast(void**)&luaopen_table, "luaopen_table");
			bindFunc(cast(void**)&luaopen_io, "luaopen_io");
			bindFunc(cast(void**)&luaopen_os, "luaopen_os");
			bindFunc(cast(void**)&luaopen_string, "luaopen_string");
			bindFunc(cast(void**)&luaopen_bit32, "luaopen_bit32");
			bindFunc(cast(void**)&luaopen_math, "luaopen_math");
			bindFunc(cast(void**)&luaopen_debug, "luaopen_debug");
			bindFunc(cast(void**)&luaopen_package, "luaopen_package");
			bindFunc(cast(void**)&luaL_openlibs, "luaL_openlibs");
		}
	}
	
	public
    {
        this()
        {
            super(libNames);
        }
    }
}

__gshared DerelictLuaLoader DerelictLua;

shared static this()
{
    DerelictLua = new DerelictLuaLoader();
}

shared static ~this()
{
    DerelictLua.unload();
}