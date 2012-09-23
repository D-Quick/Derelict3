module derelict.lua.macros;
private {
	import derelict.lua.functions;
	import derelict.lua.types;
}
//lua.h
void lua_call(lua_State* L, int nargs, int nresults) {
	lua_callk(L, nargs, nresults, 0, null);
}
int lua_pcall(lua_State* L, int nargs, int nresults, int errfunc) {
	return lua_pcallk(L, nargs, nresults, errfunc, 0, null);
}
int lua_yield(lua_State* L, int nresults) {
	return lua_yieldk(L, nresults, 0, null);
}

lua_Number lua_tonumber(lua_State* L, int i) {
	return lua_tonumberx(L, i, null);
}
lua_Integer lua_tointeger(lua_State* L, int i) {
	return lua_tointegerx(L, i, null);
}
lua_Unsigned lua_tounsigned(lua_State* L, int i) {
	return lua_tounsignedx(L, i, null);
}

void lua_pop(lua_State* L, int idx) {
	lua_settop(L, (-idx)-1);
}
void lua_newtable(lua_State* L) {
	lua_createtable(L, 0, 0);
}

void lua_register(lua_State* L, const(char)* n, lua_CFunction f) {
	lua_pushcfunction(L, f);
	lua_setglobal(L, n);
}
void lua_pushcfunction(lua_State* L, lua_CFunction f) {
	lua_pushcclosure(L, f, 0);
}

bool lua_isfunction(lua_State* L, int idx) {
	return lua_type(L, idx) == LUA_TFUNCTION;
}
bool lua_istable(lua_State* L, int idx) {
	return lua_type(L, idx) == LUA_TTABLE;
}
bool lua_islightuserdata(lua_State* L, int idx) {
	return lua_type(L, idx) == LUA_TLIGHTUSERDATA;
}
bool lua_isnil(lua_State* L, int idx) {
	return lua_type(L, idx) == LUA_TNIL;
}
bool lua_isboolean(lua_State* L, int idx) {
	return lua_type(L, idx) == LUA_TBOOLEAN;
}
bool lua_isthread(lua_State* L, int idx) {
	return lua_type(L, idx) == LUA_TTHREAD;
}
bool lua_isnone(lua_State* L, int idx) {
	return lua_type(L, idx) == LUA_TNONE;
}
bool lua_isnoneornil(lua_State* L, int idx) {
	return lua_type(L, idx) <= 0;
}

const(char)* lua_pushliteral(lua_State* L, const(char)* s) {
	return lua_pushlstring(L, s, (s.sizeof / char.sizeof) - 1);
}
void lua_pushglobaltable(lua_State* L) {
	lua_rawgeti(L, LUA_REGISTRYINDEX, LUA_RIDX_GLOBALS);
}
const(char)* lua_tostring(lua_State* L, int idx) {
	return lua_tolstring(L, idx, null);
}
//lauxlib.h
void luaL_checkversion(lua_State* L) {
	luaL_checkversion_(L, LUA_VERSION_NUM);
}
int luaL_loadfile(lua_State* L, const(char)* f) {
	return luaL_loadfilex(L, f, null);
}

void luaL_newlibtable(lua_State* L, luaL_Reg* l) {
	lua_createtable(L, 0, l.sizeof / l[0].sizeof - 1);
}
void luaL_newlib(lua_State* L, luaL_Reg* l) {
	luaL_newlibtable(L, l);
	luaL_setfuncs(L, l, 0);
}
/*int luaL_argcheck(lua_State* L, cond, int numarg, const(char)*extramsg) {
	((void)((cond) || luaL_argerror(L, (numarg), (extramsg))))
}*/
const(char)* luaL_checkstring(lua_State* L, int n) {
	return luaL_checklstring(L, n, null);
}
const(char)* luaL_optstring(lua_State* L, int n, const(char)* d) {
	return luaL_optlstring(L, n, d, null);
}
int luaL_checkint(lua_State* L, int n){
	return luaL_checkinteger(L, n);
}
int luaL_optint(lua_State* L, int n, lua_Integer d) {
	return luaL_optinteger(L, n, d);
}
long luaL_checklong(lua_State* L, int n) {
	return luaL_checkinteger(L, n);
}
long luaL_optlong(lua_State* L, int n, lua_Integer d) {
	return luaL_optinteger(L, (n), (d));
}
const(char)* luaL_typename(lua_State* L, int i) {
	return lua_typename(L, lua_type(L,i));
}
int luaL_dofile(lua_State* L, const(char)* fn) {
	luaL_loadfile(L, fn);
	return lua_pcall(L, 0, LUA_MULTRET, 0);
}
int luaL_dostring(lua_State* L, const(char)* s) {
	luaL_loadstring(L, s);
	return lua_pcall(L, 0, LUA_MULTRET, 0);
}
void luaL_getmetatable(lua_State* L, const(char)* n) {
	lua_getfield(L, LUA_REGISTRYINDEX, n);
}
/*#define luaL_opt(lua_State* L,f, int n,d) {
	return lua_isnoneornil(L, n) ? d : f(L,n);
}*/
int luaL_loadbuffer(lua_State* L, const(char)* s, size_t sz, const(char)* n) {
	return luaL_loadbufferx(L, s, sz, n, null);
}

/*#define luaL_addchar(B,c) \
  ((void)((B)->n < (B)->size || luaL_prepbuffsize((B), 1)), \
   ((B)->b[(B)->n++] = (c)))
#define luaL_addsize(B,s)	((B)->n += (s))*/
void luaL_register(lua_State* L, const(char)* n, const(luaL_Reg)* l) {
	luaL_openlib(L, n, l, 0);
}
//luaconf.h
/*#define luai_writestring(s,l)	fwrite((s), sizeof(char), (l), stdout)
#define luai_writeline()	(luai_writestring("\n", 1), fflush(stdout))
#define luai_writestringerror(s,p) \
	(fprintf(stderr, (s), (p)), fflush(stderr))
#define lua_cpcall(L,f,u)  \
	(lua_pushcfunction(L, (f)), \
	 lua_pushlightuserdata(L,(u)), \
	 lua_pcall(L,1,0,0))
#define lua_strlen(L,i)		lua_rawlen(L, (i))

#define lua_objlen(L,i)		lua_rawlen(L, (i))

#define lua_equal(L,idx1,idx2)		lua_compare(L,(idx1),(idx2),LUA_OPEQ)
#define lua_lessthan(L,idx1,idx2)	lua_compare(L,(idx1),(idx2),LUA_OPLT)
#define lua_number2str(s,n)	sprintf((s), LUA_NUMBER_FMT, (n))
#define lua_strx2number(s,p)	strtod((s), (p))
#define luai_nummod(L,a,b)	((a) - floor((a)/(b))*(b))
#define luai_numpow(L,a,b)	(pow(a,b))
#define luai_numadd(L,a,b)	((a)+(b))
#define luai_numsub(L,a,b)	((a)-(b))
#define luai_nummul(L,a,b)	((a)*(b))
#define luai_numdiv(L,a,b)	((a)/(b))
#define luai_numunm(L,a)	(-(a))
#define luai_numeq(a,b)		((a)==(b))
#define luai_numlt(L,a,b)	((a)<(b))
#define luai_numle(L,a,b)	((a)<=(b))
#define luai_numisnan(L,a)	(!luai_numeq((a), (a)))*/
//lualib.h