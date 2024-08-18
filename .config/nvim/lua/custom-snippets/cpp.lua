-- Cpp Custom Snippets
local fmt = require("luasnip.extras.fmt").fmt
local snippet = require("luasnip").snippet
local insert = require("luasnip").insert_node

return {
    snippet(
        "competitive",
        fmt(
            [[
#ifdef LOCALDEB
#include "/home/morven/code/competitive-programming/conf/debug.h"
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
#define spne(i) (" \n"[i == 0])

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
template <class T>
using pq = priority_queue<T>;
template <class T>
using pqg = priority_queue<T, vector<T>, greater<T>>;

const ll INF = LONG_LONG_MAX;
const int inf = INT_MAX;
const ld PI = acos(-1);
const vector<int> DX{{1, 0, -1, 0}}, DY{{0, 1, 0, -1}};
ll testId = 0;

void _() {{
    ios::sync_with_stdio(false);
    cin.tie(0);
    cout.tie(0);
#ifdef LOCAL
    freopen("/home/morven/code/competitive-programming/conf/main.in", "r",
            stdin);
    freopen("/home/morven/code/competitive-programming/conf/main.out", "w",
            stdout);
    freopen("/home/morven/code/competitive-programming/conf/main.err", "w",
            stderr);
#endif
}}

void init();

void solve();

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

void init() {{}}
{}
void solve() {{}}
    ]],
            { insert(0) }
        )
    ),

    snippet(
        "sout",
        fmt(
            [[
cout << {} << endl;
        ]],
            { insert(0) }
        )
    ),

    snippet(
        "db",
        fmt(
            [[
deb({});
        ]],
            { insert(0) }
        )
    ),
}
