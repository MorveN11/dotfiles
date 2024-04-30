return {
	"L3MON4D3/LuaSnip",
	build = (not LazyVim.is_win())
			and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
		or nil,
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		{
			"nvim-cmp",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
			},
			opts = function(_, opts)
				opts.snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				}
				table.insert(opts.sources, { name = "luasnip" })
			end,
		},
	},
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
	keys = {
		{
			"<tab>",
			function()
				return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
			end,
			expr = true,
			silent = true,
			mode = "i",
		},
		{
			"<tab>",
			function()
				require("luasnip").jump(1)
			end,
			mode = "s",
		},
		{
			"<s-tab>",
			function()
				require("luasnip").jump(-1)
			end,
			mode = { "i", "s" },
		},
	},
	config = function()
		local fmt = require("luasnip.extras.fmt").fmt
		local ls = require("luasnip")
		local s = ls.snippet
		local i = ls.insert_node

		ls.add_snippets("cpp", {
			s(
				"competitive",
				fmt(
					[[
       #ifdef LOCAL
			    #include "/home/morven/Desktop/code/competitive-programming/conf/debug.h"
			    #define line cerr << "-------------------" << endl;
			    #else
			    #define deb(x...)
			    #define line
			    #endif
			
			    #include <bits/stdc++.h>
			    using namespace std;
			
			    #define endl '\n'
			    #define F first
			    #define S second
			    #define pb push_back
			    #define sz size
			    #define all(x) begin(x), end(x)
			    #define sortt(x) sort(all(x))
			    #define each(x, xs) for (auto &x : (xs))
			    #define rep(i, be, en) for (__typeof(en) i = (be); i < (en); i++)
			    #define per(i, be) for (__typeof(be) i = (be) - 1; i >= 0; i--)
			    #define readline(x) getline(cin, x)
			    #define strInt(str) stoi(str)
			    #define chrInt(chr) (int)chr - 48
			    #define ensp(i, n) (" \n"[i == n - 1])
			
			    template <typename... T> void cinn(T &...args) {{ ((cin >> args), ...); }}
			
			    template <typename... T> void coutt(const T &...args) {{
			      __typeof(sizeof...(T)) i = 1;
			      ((cout << args << (i++ != sizeof...(T) ? " " : "")), ...);
			      cout << '\n';
			    }}
			
			    template <typename T> void couts(const T &xs) {{
			      for (__typeof(xs.sz()) i = 0; i < xs.sz(); i++) {{
			        cout << xs[i] << " \n"[i == xs.sz() - 1];
			      }}
			    }}
			
			    using ll = long long;
			    using ld = long double;
			    using lli = long long int;
			    using pi = pair<int, int>;
			    using pl = pair<ll, ll>;
			    using ti = tuple<int, int, int>;
			    using tl = tuple<ll, ll, ll>;
			    using vi = vector<int>;
			    using vb = vector<bool>;
			    using vl = vector<ll>;
			    using vs = vector<string>;
			    using vvi = vector<vector<int>>;
			    using vvl = vector<vector<ll>>;
			    using vpi = vector<pair<int, int>>;
			    using vpl = vector<pair<ll, ll>>;
			    template <class T> using pq = priority_queue<T>;
			    template <class T> using pqg = priority_queue<T, vector<T>, greater<T>>;
			
			    const ll INF = INT64_MAX;
			    const int inf = INT32_MAX;
			    const ld PI = acos(-1);
			    const lli MOD = 1e9 + 7;
			    const vector<int> DX{{1, 0, -1, 0}}, DY{{0, 1, 0, -1}};
			    ll testId = 0;
			
       void _() {{
         ios::sync_with_stdio(0);
         cin.tie(0);
         cout.tie(0);
       #ifdef LOCAL
         freopen("/home/morven/Desktop/code/competitive-programming/conf/main.in", "r",
                 stdin);
         freopen("/home/morven/Desktop/code/competitive-programming/conf/main.out",
                 "w", stdout);
         freopen("/home/morven/Desktop/code/competitive-programming/conf/main.err",
                 "w", stderr);
       #endif
       }}

			    void solve();
			
			    void init();
			
			    void exit();
			
			    int main() {{
			      _();
			      init();
			      ll T = 1;
			      // cinn(T);
			      rep(t, 0, T) {{
			        testId++;
			        solve();
			      }}
			      return 0;
			    }}
			
			    const ll MAXN = 202020;
       {}
			    void init() {{}}
			
			    void exit() {{}}
			
			    void solve() {{}}
          ]],
					{ i(0) }
				)
			),
			s(
				"sout",
				fmt(
					[[
          cout << {} << endl;
          ]],
					{ i(0) }
				)
			),
			s(
				"db",
				fmt(
					[[
          db({});
          ]],
					{ i(0) }
				)
			),
		})
	end,
}
