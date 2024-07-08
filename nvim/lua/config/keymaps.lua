local discipline = require("util.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<C-S-j>", function()
	vim.diagnostic.goto_prev()
end, opts)

-- Move Line Down Up
keymap.set("n", "<C-S-Down>", ":m+1<CR>", opts)
keymap.set("n", "<C-S-Up>", ":m-2<CR>", opts)

-- Move Line Down Up Visual and Keep Selection
keymap.set("v", "<C-S-Down>", ":m'>+1<CR>gv", opts)
keymap.set("v", "<C-S-Up>", ":m'<-2<CR>gv", opts)

-- Go to the end beginning of the line
keymap.set("n", "<C-l>", "$", opts)
keymap.set("n", "<C-h>", "^", opts)

-- Oil Setup
local oil = require("oil")
oil.setup()
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Neogen Setup
keymap.set("n", "<leader>ng", ":lua require('neogen').generate()<CR>", opts)

-- Refactoring Setup
keymap.set({ "n", "x" }, "<leader>rr", function()
	require("refactoring").select_refactor()
end, { desc = "Select refactoring" })

-- Competitive programming Setup
keymap.set("n", "<leader>pr", ":CompetiTest run<CR>", opts)
keymap.set("n", "<leader>pa", ":CompetiTest add_testcase<CR>", opts)
keymap.set("n", "<leader>pp", ":CompetiTest receive problem<CR>", opts)
keymap.set("n", "<leader>pe", ":CompetiTest edit_testcase", { desc = "Edit the test" })
keymap.set("n", "<leader>pd", ":CompetiTest delete_testcase", { desc = "Delete the test" })
keymap.set("n", "<leader>ps", ":CompetiTest show_ui<CR>", opts)

-- Rest Setup
keymap.set("n", "<leader>h", ":Rest run<CR>", opts)

-- DB UI Setup
keymap.set("n", "<leader>d", ":DBUIToggle<CR>", opts)

-- Snippets
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
