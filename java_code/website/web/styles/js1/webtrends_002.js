var l = void 0;
(function(j, i, k, n) {
	function m(a) {
		if (a) {
			if (!a.forEach) a.forEach = function(a, c) {
				for (var f = c || window, d = 0, g = this.length; d < g; ++d) a.call(f, this[d], d, this)
			};
			if (!a.filter) a.filter = function(a, c) {
				for (var f = c || window, d = [], g = 0, h = this.length; g < h; ++g) a.call(f, this[g], g, this) && d.push(this[g]);
				return d
			};
			if (!a.indexOf) a.indexOf = function(a) {
				for (var c = 0; c < this.length; ++c) if (this[c] === a) return c;
				return - 1
			}
		}
		return a
	}
	if (!j.Ab) {
		var d = {
			b: {},
			plugins: {},
			hb: 0,
			d: {},
			addEventListener: j.addEventListener ?
			function(a, b, c) {
				a.addEventListener && a.addEventListener(b, c, !1)
			}: function(a, b, c) {
				a.attachEvent && a.attachEvent("on" + b, c, !1)
			},
			f: {},
			version: "10.2.1",
			n: {},
			ob: !1,
			q: 25,
			Y: function() {
				if (n.search) d.n = d.ra(n.search);
				if (j.webtrendsAsyncInit && !j.webtrendsAsyncInit.hasRun) j.webtrendsAsyncInit(),
				j.webtrendsAsyncInit.hasRun = !0;
				d.addEventListener(j, "load",
				function() {
					d.ob = !0
				})
			},
			e: function(a) {
				return Object.prototype.toString.call(a) === "[object Function]"
			},
			rb: function(a) {
				var b = [],
				c;
				for (c in a) a.hasOwnProperty(c) && a[c] != "" && a[c] != l && typeof a[c] != "function" && b.push({
					k: c,
					v: a[c]
				});
				return b
			},
			extend: function(a, b, c) {
				for (key in b) if (c || typeof a[key] === "undefined") a[key] = b[key];
				return a
			},
			find: function(a) {
				if (!d.Aa) d.Aa = d.mb();
				return d.Aa(a)
			},
			mb: function() {
				var a = /MSIE (\d+)/.exec(k.userAgent),
				a = a ? a[1] : 99;
				if (i.querySelectorAll && i.body && a > 8) {
					var b = i.body;
					return function(a) {
						return b.querySelectorAll(a)
					}
				}
				if (j.qb) return j.qb.find;
				if (j.Fa) return j.Fa;
				if (j.Bb && YAHOO.Da && YAHOO.Da.Ea) return YAHOO.Da.Ea.Jb;
				if ("qwery" in j) return qwery;
				j.Cb && YUI().Mb("node",
				function(a) {
					return a.all
				});
				return i.querySelectorAll ? (b = i.body) ?
				function(a) {
					return b.querySelectorAll(a)
				}: function() {
					return []
				}: function() {
					return []
				}
			},
			ra: function(a) {
				var a = a.split(/[&?]/g),
				b = {};
				try {
					for (var c = 0, f = a.length; c < f; ++c) {
						var d = a[c].match(/^([^=]+)(?:=([\s\S]*))?/);
						if (d && d[1]) {
							var g = decodeURIComponent(d[1]);
							b[g] ? (b[g] = [b[g]], b[g].push(decodeURIComponent(d[2]))) : b[g] = decodeURIComponent(d[2])
						}
					}
				} catch(h) {
					this.D.push(h),
					this.r(h)
				}
				return b
			},
			ua: function(a, b, c) {
				arguments.length < 2 && (b = !0);
				s = i.createElement("script");
				s.type = "text/javascript";
				s.async = b;
				s.src = a;
				s2 = i.getElementsByTagName("script")[0];
				s2.parentNode.insertBefore(s, s2)
			},
			S: function(a, b) {
				for (var c = a.target || a.srcElement; c && c.tagName && c.tagName.toLowerCase() != b.toLowerCase();) c = c.parentElement || c.parentNode;
				return c
			},
			ea: function(a) {
				return typeof encodeURIComponent == "function" ? encodeURIComponent(a) : escape(a)
			},
			wa: function(a) {
				for (var b in d.b) d.b[b].ga(a);
				return ! 1
			},
			N: function(a, b, c) {
				b || (b = "collect");
				c ? d.O("transform." + b, a, c) : d.O("transform." + b, a);
				return this
			},
			O: function(a, b, c) {
				function f(b, c) {
					d.f[a][b.j] || (d.f[a][b.j] = m([]));
					d.f[a][b.j].push(c)
				}
				if (a && b && a != "" && d.e(b)) {
					if (a === "wtmouseup" && !d.xa) d.addEventListener(i, "mouseup",
					function(b) {
						if (!b) b = window.event;
						d.Sa(a, {
							event: b
						})
					}),
					d.xa = !0;
					d.f[a] || (d.f[a] = {});
					if (c) f(c, b);
					else for (dcsid in d.b) f(d.b[dcsid], b)
				}
			},
			Sa: function(a, b) {
				for (dcsid in d.b) d.fireEvent(a, d.b[dcsid], b)
			},
			Ga: function(a, b, c, f) {
				if (typeof b === "function") return b.onetime ? (c.push(b), !0) : (b(a, f), !1)
			},
			fireEvent: function(a, b, c) {
				var f = m([]);
				if (d.f[a] && d.f[a][b.j]) {
					a = d.f[a][b.j];
					if (!a.length) return;
					for (var e = a.length - 1; e >= 0; e--) d.Ga(b, a[e], f, c) && a.pop()
				}
				f.forEach(function(a) {
					a(b, c)
				})
			},
			Z: function(a, b) {
				var c = !1;
				for (dcsid in d.b) {
					var f = d.b[dcsid];
					a in f.plugins && (c = !0, f.Z(a, b))
				}
				c || b({
					Ib: !0
				})
			},
			z: function() {
				for (dcsid in d.b) d.b[dcsid].z()
			}
		},
		p = d.fireEvent,
		q = d.O;
		d.a = function() {
			this.oa = j.aa ? /dcs(uri)|(ref)|(aut)|(met)|(sta)|(sip)|(pro)|(byt)|(dat)|(p3p)|(cfg)|(redirect)|(cip)/i: "";
			this.za = {};
			this.plugins = this.plugins = {};
			this.c = this.WT = {};
			this.g = this.DCS = {};
			this.o = this.DCSext = {};
			this.j = this.dcssID = "dcsobj_" + d.hb++;
			this.images = this.images = [];
			this.D = this.errors = [];
			this.da = {};
			this.images = [];
			this.G = [];
			this.Eb = [];
			this.h = [];
			this.K = [];
			this.M = "";
			this.T = !1;
			this.m = 0;
			this.W = this.qa = "";
			this.xa = !1;
			return this
		};
		d.a.prototype = {
			Y: function(a) {
				function b(b, f) {
					return a.hasOwnProperty(b) ? a[b] : f
				}
				this.Fb = a;
				this.r = b("errorlogger",
				function() {});
				this.gb = this.dcsid = a.dcsid;
				this.I = this.queue = b("queue", []);
				this.domain = this.domain = b("domain", "statse.webtrendslive.com");
				this.yb = this.timezone = b("timezone", -8);
				this.pa = b("fpcdom", "");
				this.enabled = this.enabled = b("enabled", !0);
				this.X = this.i18n = b("i18n", !0);
				this.za = j.aa ? this.X ? {
					"%25": /\%/g,
					"%26": /\&/g,
					"%23": /\#/g
				}: {
					"%09": /\t/g,
					"%20": / /g,
					"%23": /\#/g,
					"%26": /\&/g,
					"%2B": /\+/g,
					"%3F": /\?/g,
					"%5C": /\\/g,
					"%22": /\"/g,
					"%7F": /\x7F/g,
					"%A0": /\xA0/g
				}: "";
				this.V = this.fpc = b("fpc", "WT_FPC");
				this.la = b("disablecookie", !1);
				if (a.metanames) this.va = m(a.metanames.toLowerCase().split(","));
				this.$ = this.vtid = b("vtid", l);
				this.ya = b("paidsearchparams", "gclid");
				this.wb = this.splitvalue = b("splitvalue", "");
				d.q = a.dcsdelay || d.q;
				this.ib = this.delayAll = b("delayAll", !1);
				this.H = this.preserve = b("preserve", !0);
				this.G = m(b("navigationtag", "div,table").toLowerCase().split(","));
				this.h = b("onsitedoms", "");
				if (!d.e(this.h.test)) this.h = m(this.h.toLowerCase().split(",")),
				this.h.forEach(function(a, b, d) {
					d[b] = a.replace(/^\s*/, "").replace(/\s*$/, "")
				});
				this.K = m(b("downloadtypes", "xls,doc,pdf,txt,csv,zip,docx,xlsx,rar,gzip").toLowerCase().split(","));
				this.K.forEach(function(a, b, d) {
					d[b] = a.replace(/^\s*/, "").replace(/\s*$/, "")
				});
				if (b("adimpressions", !1)) this.M = b("adsparam", "WT.ac");
				this.w = this.cookieExp = b("cookieexpires", 63113851500);
				this.w != 0 ? (this.w = this.w < 63113851500 ? this.w: 63113851500, this.da = new Date(this.getTime() + this.w), this.T = !1) : this.T = !0;
				m(b("pageEvents", [])).forEach(function(b) {
					this.Db = a[b.toLowerCase()] = !0
				});
				b("offsite", !1) && this.Oa();
				b("download", !1) && this.Ma();
				b("anchor", !1) && this.La();
				b("javascript", !1) && this.Na();
				b("rightclick", !1) && this.Pa();
				b("privateFlag", !1) || (d.b[this.j] = this);
				this.plugins = a.plugins || {};
				this.Ha();
				d.d[this.domain] || (d.d[this.domain] = "");
				b("privateFlag", !1) || this.$a(this.j);
				this.P();
				return this
			},
			Ha: function() {
				for (var a in this.plugins) {
					var b = this.plugins[a];
					if (!d.plugins[a]) {
						d.plugins[a] = b;
						var c = b.src;
						d.e(c) ? j.setTimeout(function(a) {
							return function() {
								a()
							}
						} (c), 1) : d.ua(c, !1)
					}
					if (!b.async) {
						var f = this;
						b.loaded = !1;
						this.m++;
						b.timeout && j.setTimeout(function(a) {
							return function() {
								if (!a.loaded) a.xb = !0,
								f.m--,
								f.P()
							}
						} (b), b.timeout)
					}
				}
			},
			ab: function(a) {
				if (typeof a != "undefined") ! d.d[this.domain] && a.gTempWtId && (d.d[this.domain] = a.gTempWtId),
				this.W = a.gTempWtId,
				!d.d[this.domain] && a.gWtId && (d.d[this.domain] = a.gWtId),
				this.qa = a.gWtAccountRollup;
				this.m--;
				this.P()
			},
			$a: function(a) {
				return i.cookie.indexOf(this.V + "=") == -1 && i.cookie.indexOf("WTLOPTOUT=") == -1 && !this.la ? (this.enabled && (d.ua("//" + this.domain + "/" + this.gb + "/wtid.js?callback=Webtrends.dcss." + a + ".dcsGetIdCallback", !0), this.m++), !1) : !0
			},
			Z: function(a, b) {
				var c = this.plugins[a];
				if (c) d.e(b) && (this.pb() ? b(this, c) : q("onready",
				function(a, b, c) {
					function d() {
						a(b, c)
					}
					d.onetime = !0;
					return d
				} (b, this, c), this)),
				c.loaded = !0,
				!c.async && !c.xb && this.m--;
				this.P()
			},
			pb: function() {
				return this.m <= 0
			},
			P: function() {
				this.m <= 0 && this.vb()
			},
			vb: function() {
				if (!this.Ia) p("onready", this),
				this.nb(),
				this.ub(),
				this.Ia = !0
			},
			nb: function() {
				for (var a = 0; a < this.I.length; a++) this.ma(this.I[a]);
				this.I = []
			},
			ub: function() {
				var a = this;
				this.I.push = function(b) {
					a.ma(b)
				}
			},
			N: function(a, b) {
				d.N(a, b, this)
			},
			p: function(a, b) {
				var c = this,
				a = a.toLowerCase(),
				f = d.extend({
					domEvent: "click",
					callback: l,
					argsa: [],
					args: {},
					delayTime: l,
					transform: l,
					filter: l,
					finish: l
				},
				b, !0);
				q("wtmouseup",
				function(b, g) {
					c.Qa(c, a, d.extend(g, f, !0))
				},
				c);
				return this
			},
			Ba: function(a, b, c, d) {
				b.element = c;
				if (d === "form" || d === "input" || d === "button") b.domEvent = "submit";
				a.ba(b)
			},
			Qa: function(a, b, c) {
				var f = d.find;
				if (f && c.event) {
					var e = d.S(c.event, "A"),
					g = e.tagName ? e.tagName.toLowerCase() : "";
					if (b === "a" && g === "a") return this.Ba(a, c, e, g);
					if ((b = f(b)) && e && b && b.length) for (f = 0; f < b.length; f++) if (b[f] === e) {
						this.Ba(a, c, e, g);
						break
					}
				}
			},
			U: function(a, b) {
				var c = m(i.cookie.split("; ")).filter(function(b) {
					return b.indexOf(a + "=") != -1
				})[0];
				if (!c || c.length < a.length + 1) return ! 1;
				m(c.split(a + "=")[1].split(":")).forEach(function(a) {
					a = a.split("=");
					b[a[0]] = a[1]
				});
				return ! 0
			},
			eb: function(a, b, c) {
				var f = [],
				b = d.rb(b);
				m(b).forEach(function(a) {
					f.push(a.k + "=" + a.v)
				});
				f = f.sort().join(":");
				i.cookie = a + "=" + f + c
			},
			bb: function(a, b, c, d) {
				var e = {};
				return this.U(a, e) ? b == e.id && c == e.lv && d == e.ss ? 0 : 3 : 2
			},
			Za: function() {
				var a = {};
				this.U(this.V, a);
				return a
			},
			Ya: function() {
				if (i.cookie.indexOf("WTLOPTOUT=") == -1) {
					var a = this.c,
					b = this.V,
					c = new Date,
					f = c.getTimezoneOffset() * 6E4 + this.yb * 36E5;
					c.setTime(c.getTime() + f);
					var e = new Date(c.getTime());
					a.co_f = a.vtid = a.vtvs = a.vt_f = a.vt_f_a = a.vt_f_s = a.vt_f_d = a.vt_f_tlh = a.vt_f_tlv = "";
					var g = {};
					if (this.U(b, g)) {
						var h = g.id,
						r = parseInt(g.lv),
						j = parseInt(g.ss);
						if (h == null || h == "null" || isNaN(r) || isNaN(j)) return;
						a.co_f = h;
						h = new Date(r);
						a.vt_f_tlh = Math.floor((h.getTime() - f) / 1E3);
						e.setTime(j);
						if (c.getTime() > h.getTime() + 18E5 || c.getTime() > e.getTime() + 288E5) a.vt_f_tlv = Math.floor((e.getTime() - f) / 1E3),
						e.setTime(c.getTime()),
						a.vt_f_s = "1";
						if (c.getDate() != h.getDate() || c.getMonth() != h.getMonth() || c.getFullYear() != h.getFullYear()) a.vt_f_d = "1"
					} else {
						if (this.W.length) a.co_f = d.d[this.domain].length ? d.d[this.domain] : this.W,
						a.vt_f = "1";
						else if (d.d[this.domain].length) a.co_f = d.d[this.domain];
						else {
							a.co_f = "2";
							j = c.getTime().toString();
							for (h = 2; h <= 32 - j.length; h++) a.co_f += Math.floor(Math.random() * 16).toString(16);
							a.co_f += j;
							a.vt_f = "1"
						}
						this.qa.length == 0 && (a.vt_f_a = "1");
						a.vt_f_s = a.vt_f_d = "1";
						a.vt_f_tlh = a.vt_f_tlv = "0"
					}
					a.co_f = escape(a.co_f);
					a.vtid = typeof this.$ == "undefined" ? a.co_f: this.$ || "";
					a.vtvs = (e.getTime() - f).toString();
					f = (this.T ? "": "; expires=" + this.da.toGMTString()) + "; path=/" + (this.pa != "" ? "; domain=" + this.pa: "");
					c = c.getTime().toString();
					e = e.getTime().toString();
					g.id = a.co_f;
					g.lv = c;
					g.ss = e;
					this.eb(b, g, f);
					b = this.bb(b, a.co_f, c, e);
					if (b != 0) a.co_f = a.vtvs = a.vt_f_s = a.vt_f_d = a.vt_f_tlh = a.vt_f_tlv = "",
					typeof this.$ == "undefined" && (a.vtid = ""),
					a.vt_f = a.vt_f_a = b
				}
			},
			zb: function() {
				try {
					var a;
					arguments && arguments.length > 1 ? a = {
						argsa: Array.prototype.slice.call(arguments)
					}: arguments.length === 1 && (a = arguments[0]);
					typeof a === "undefined" && (a = {
						element: l,
						event: l,
						Ra: []
					});
					typeof a.argsa === "undefined" && (a.argsa = []);
					this.na("collect", a);
					return this
				} catch(b) {
					this.D.push(b),
					this.r(b)
				}
			},
			ga: function(a) {
				a && a.length > 1 && (a = {
					argsa: Array.prototype.slice.call(arguments)
				});
				this.ba(a)
			},
			ba: function(a) {
				try {
					if (typeof a !== "undefined") {
						this.na("multitrack", a);
						if (a.delayTime) {
							var b = Number(a.delayTime);
							this.Ca(isNaN(b) ? d.q: b)
						} else this.ib && this.Ca(d.q);
						return ! 1
					}
				} catch(c) {
					this.D.push(c),
					this.r(c)
				}
			},
			Ua: function() {
				this.g = {};
				this.c = {};
				this.o = {};
				arguments.length % 2 == 0 && this.A(arguments)
			},
			A: function(a) {
				if (a) for (var b = 0, c = a.length; b < c; b += 2) a[b].indexOf("WT.") == 0 ? this.c[a[b].substring(3)] = a[b + 1] : a[b].indexOf("DCS.") == 0 ? this.g[a[b].substring(4)] = a[b + 1] : a[b].indexOf("DCSext.") == 0 && (this.o[a[b].substring(7)] = a[b + 1])
			},
			ia: function(a) {
				var b, c;
				if (this.H) {
					this.u = [];
					for (var d = 0, e = a.length; d < e; d += 2) c = a[d],
					c.indexOf("WT.") == 0 ? (b = c.substring(3), this.u.push(c, this.c[b] || "")) : c.indexOf("DCS.") == 0 ? (b = c.substring(4), this.u.push(c, this.g[b] || "")) : c.indexOf("DCSext.") == 0 && (b = c.substring(7), this.u.push(c, this.o[b] || ""))
				}
			},
			ha: function() {
				if (this.H) this.A(this.u),
				this.u = []
			},
			fb: function() {
				var a = new Date,
				b = this,
				c = this.c,
				f = this.g;
				c.tz = parseInt(a.getTimezoneOffset() / 60 * -1) || "0";
				c.bh = a.getHours() || "0";
				c.ul = k.appName == "Netscape" ? k.language: k.Nb;
				if (typeof screen == "object") c.cd = k.appName == "Netscape" ? screen.pixelDepth: screen.colorDepth,
				c.sr = screen.width + "x" + screen.height;
				typeof k.javaEnabled() == "boolean" && (c.jo = k.javaEnabled() ? "Yes": "No");
				i.title && (c.ti = j.aa ? i.title.replace(RegExp("^" + n.protocol + "//" + n.hostname + "\\s-\\s"), "") : i.title);
				c.js = "Yes";
				c.jv = function() {
					var a = navigator.userAgent.toLowerCase(),
					b = parseInt(navigator.appVersion),
					c = a.indexOf("mac") != -1,
					d = a.indexOf("firefox") != -1,
					f = a.indexOf("firefox/0.") != -1,
					e = a.indexOf("firefox/1.0") != -1,
					g = a.indexOf("firefox/1.5") != -1,
					h = a.indexOf("firefox/2.0") != -1,
					i = !d && a.indexOf("mozilla") != -1 && a.indexOf("compatible") == -1,
					j = a.indexOf("msie") != -1 && a.indexOf("opera") == -1,
					k = j && b == 4 && a.indexOf("msie 4") != -1,
					j = j && !k,
					m = a.indexOf("opera 5") != -1 || a.indexOf("opera/5") != -1,
					n = a.indexOf("opera 6") != -1 || a.indexOf("opera/6") != -1,
					a = a.indexOf("opera") != -1 && !m && !n,
					o = "1.1";
					d && !f && !e & !g & !h ? o = "1.8": h ? o = "1.7": g ? o = "1.6": f || e || i && b >= 5 || a ? o = "1.5": c && j || n ? o = "1.4": j || i && b == 4 || m ? o = "1.3": k && (o = "1.2");
					return o
				} ();
				c.ct = "unknown";
				if (i.body && i.body.addBehavior) try {
					i.body.addBehavior("#default#clientCaps"),
					c.ct = i.body.Gb || "unknown",
					i.body.addBehavior("#default#homePage"),
					c.hp = i.body.Hb(location.href) ? "1": "0"
				} catch(e) {
					b.r(e)
				}
				c.bs = i.all ? i.body ? i.body.offsetWidth + "x" + i.body.offsetHeight: "unknown": j.innerWidth + "x" + j.innerHeight;
				c.fv = function() {
					var a;
					if (j.ActiveXObject) for (a = 15; a > 0; a--) try {
						return new ActiveXObject("ShockwaveFlash.ShockwaveFlash." + a),
						a + ".0"
					} catch(c) {
						b.r(c)
					} else if (k.plugins && k.plugins.length) for (a = 0; a < k.plugins.length; a++) if (k.plugins[a].name.indexOf("Shockwave Flash") != -1) return k.plugins[a].description.split(" ")[2];
					return "Not enabled"
				} ();
				c.slv = function() {
					var a = "Not enabled";
					try {
						k.userAgent.indexOf("MSIE") != -1 ? new ActiveXObject("AgControl.AgControl") && (a = "Unknown") : k.plugins["Silverlight Plug-In"] && (a = "Unknown")
					} catch(c) {
						b.r(c)
					}
					if (a != "Not enabled") {
						var d, f, e;
						if (typeof Silverlight == "object" && typeof Silverlight.ta == "function") {
							for (d = 9; d > 0; d--) {
								f = d;
								if (Silverlight.ta(f + ".0")) break;
								if (a == f) break
							}
							for (d = 9; d >= 0; d--) {
								e = f + "." + d;
								if (Silverlight.ta(e)) {
									a = e;
									break
								}
								if (a == e) break
							}
						}
					}
					return a
				} ();
				this.X && (c.le = typeof i.defaultCharset == "string" ? i.defaultCharset: typeof i.characterSet == "string" ? i.characterSet: "unknown");
				c.tv = d.version;
				c.sp = this.wb;
				c.dl = "0";
				if (d.n && d.n.kb) c.fb_ref = d.n.kb;
				if (d.n && d.n.lb) c.fb_source = d.n.lb;
				c.ssl = n.protocol.indexOf("https:") == 0 ? "1": "0";
				f.dcsdat = a.getTime();
				f.dcssip = n.hostname;
				f.dcsuri = n.pathname;
				c.es = f.dcssip + f.dcsuri;
				if (n.search) f.dcsqry = n.search;
				if (f.dcsqry) for (var a = f.dcsqry.toLowerCase(), g = this.ya.length ? this.ya.toLowerCase().split(",") : [], h = 0; h < g.length; h++) if (a.indexOf(g[h] + "=") != -1) {
					c.srch = "1";
					break
				}
				if (i.referrer != "" && i.referrer != "-" && !(k.appName == "Microsoft Internet Explorer" && parseInt(k.appVersion) < 4)) f.dcsref = i.referrer;
				this.la && (f.dcscfg = "1")
			},
			Xa: function(a, b) {
				if (b != "") {
					if (a === null || a === l) return "";
					var a = a.toString(),
					c;
					for (c in b) b[c] instanceof RegExp && (a = a.replace(b[c], c));
					return a
				} else return escape(a)
			},
			Q: function(a, b) {
				if (this.X && this.oa != "" && !this.oa.test(a)) if (a == "dcsqry") {
					for (var c = "", f = b.substring(1).split("&"), e = 0; e < f.length; e++) {
						var g = f[e],
						h = g.indexOf("=");
						if (h != -1) {
							var i = g.substring(0, h),
							g = g.substring(h + 1);
							e != 0 && (c += "&");
							c += i + "=" + d.ea(g)
						}
					}
					b = b.substring(0, 1) + c
				} else b = d.ea(b);
				return "&" + a + "=" + this.Xa(b, this.za)
			},
			Va: function(a, b) {
				if (i.images) {
					var c = new Image;
					this.images.push(c);
					if (arguments.length === 2 && b && d.e(b.callback)) {
						var f = !1,
						e = b.callback,
						g = this;
						c.onload = function() {
							if (!f) return f = !0,
							e(g, b),
							!0
						};
						j.setTimeout(function() {
							if (!f) return f = !0,
							e(g, b),
							!0
						},
						d.q)
					}
					c.src = a
				}
			},
			cb: function() {
				var a;
				i.documentElement ? a = i.getElementsByTagName("meta") : i.all && (a = i.all.Lb("meta"));
				if (typeof a != "undefined") for (var b = a.length, c = 0; c < b; c++) {
					var d = a.item(c).name,
					e = a.item(c).content;
					a.item(c);
					d.length > 0 && (d = d.toLowerCase(), d.toUpperCase().indexOf("WT.") == 0 ? this.c[d.substring(3)] = e: d.toUpperCase().indexOf("DCSEXT.") == 0 ? this.o[d.substring(7)] = e: d.toUpperCase().indexOf("DCS.") == 0 ? this.g[d.substring(4)] = e: this.va && this.va.indexOf(d) != -1 && (this.o["meta_" + d] = e))
				}
			},
			ja: function(a) {
				if (i.cookie.indexOf("WTLOPTOUT=") == -1) {
					var b = this.c,
					c = this.g,
					d = this.o,
					e = this.i18n,
					g = "http" + (n.protocol.indexOf("https:") == 0 ? "s": "") + "://" + this.domain + (this.dcsid == "" ? "": "/" + this.dcsid) + "/dcs.gif?";
					e && (b.dep = "");
					for (var h in c) c[h] != "" && c[h] != l && typeof c[h] != "function" && (g += this.Q(h, c[h]));
					for (h in b) b[h] != "" && b[h] != l && typeof b[h] != "function" && (g += this.Q("WT." + h, b[h]));
					for (h in d) if (d[h] != "" && d[h] != l && typeof d[h] != "function") e && (b.dep = b.dep.length == 0 ? h: b.dep + ";" + h),
					g += this.Q(h, d[h]);
					e && b.dep.length > 0 && (g += this.Q("WT.dep", b.dep));
					g.length > 2048 && k.userAgent.indexOf("MSIE") >= 0 && (g = g.substring(0, 2040) + "&WT.tu=1");
					this.Va(g, a);
					this.c.ad = ""
				}
			},
			sb: function() {
				this.fb();
				this.cb();
				this.M && this.M.length > 0 && this.Ta();
				this.tb = !0
			},
			getTime: function() {
				return (new Date).getTime()
			},
			jb: 0,
			Ca: function(a) {
				for (var b = this.getTime(); this.getTime() - b < a;) this.jb++
			},
			na: function(a, b) {
				a || (a = "collect");
				this.I.push({
					action: a,
					message: b
				})
			},
			ma: function(a) {
				if (this.enabled) {
					var b = "action_" + a.action,
					c = a.message;
					this.tb || this.sb();
					c.event && !c.element && (c.element = d.S(c.event, "A"));
					if (!d.e(c.filter) || !c.filter(this, c)) {
						if (c.args) {
							c.argsa = c.argsa || [];
							for (var f in c.args) c.argsa.push(f, c.args[f])
						}
						c.element && c.element.getAttribute && c.element.getAttribute("data-wtmt") && (c.argsa = c.argsa.concat(c.element.getAttribute("data-wtmt").split(",")));
						p("transform." + a.action, this, c);
						p("transform.all", this, c);
						c.transform && d.e(c.transform) && c.transform(this, c);
						this.Ya();
						if (d.e(this[b])) this[b](c);
						p("finish." + a.action, this, c);
						p("finish.all", this, c);
						c.finish && d.e(c.finish) && c.finish(this, c)
					}
				}
			},
			Ka: function(a) {
				var b = a && a.argsa && a.argsa.length % 2 == 0;
				b && (this.ia(a.argsa), this.A(a.argsa));
				this.g.dcsdat = this.getTime();
				this.ja(a);
				b && this.ha()
			},
			Ja: function(a) {
				a && a.argsa && a.argsa.length % 2 == 0 && this.A(a.argsa);
				this.ja(a)
			},
			Wa: function(a) {
				arguments.length === 0 && this.images && this.images.length > 0 && (a = this.images.length - 1);
				if (a < 0 || a === l) return "No requests";
				var b = this.images[a].src,
				c = b.indexOf("?"),
				d = b.substring(0, c).split("/"),
				e = "<h3>url info</h3><b>Protocol</b>: <code>" + d[0] + "<br></code>";
				e += "<b>Domain:</b> <code>" + d[2] + "<br></code>";
				e += "<b>Path:</b> <code>/" + d[3] + "/" + d[4] + "</code>";
				e += "<h3>dcs image Params:</h3><code>" + b.substring(c + 1).replace(/\&/g, "<br>") + "</code>";
				e += "<br><h3>Cookies</h3><br><code>" + document.cookie.replace(/\;/g, "<br>") + "</code><br>";
				e += "<b>Image Count: </b><code>" + a + 1 + "<br></code>";
				this.D.length > 0 && (e += "<br><b>Errors: </b><br>", m(this.D).forEach(function(a) {
					e += a.stack ? "<pre>" + a.stack + "</pre><br>": "<pre>" + a + "</pre><br>"
				}));
				return e
			},
			z: function(a) {
				var b = !1;
				a && a.Kb && (b = !0);
				a = this.Wa();
				if (b) return a;
				else this.J && !this.J.closed && this.J.close(),
				this.J = window.open("", "dcsDebug", "width=500,height=650,scrollbars=yes,resizable=yes"),
				this.J.document.write(a),
				this.J.focus()
			},
			F: function(a) {
				var b = {};
				b.C = a.hostname ? a.hostname.split(":")[0] : "";
				b.l = a.pathname ? a.pathname.indexOf("/") != 0 ? "/" + a.pathname: a.pathname: "/";
				b.i = a.search ? a.search.substring(a.search.indexOf("?") + 1, a.search.length) : "";
				b.B = j.location;
				return b
			},
			fa: function(a, b) {
				if (a.length > 0) {
					a = a.toLowerCase();
					if (a == window.location.hostname.toLowerCase()) return ! 0;
					if (d.e(b.test)) return b.test(a);
					else if (b.length > 0) for (var c = b.length, f = 0; f < c; f++) if (a == b[f]) return ! 0
				}
				return ! 1
			},
			ka: function(a, b) {
				for (var c = a.toLowerCase().substring(a.lastIndexOf(".") + 1, a.length), d = b.length, e = 0; e < d; e++) if (c == b[e]) return ! 0;
				return ! 1
			},
			R: function(a, b) {
				var c = "",
				f = "",
				e = b.length,
				g, h;
				for (g = 0; g < e; g++) if (h = b[g], h.length && (f = d.S(a, h), c = f.getAttribute && f.getAttribute("id") ? f.getAttribute("id") : "", f = f.className || "", c.length || f.length)) break;
				return c.length ? c: f
			},
			sa: function(a, b, c) {
				var f = i.all ? b.innerText: b.text,
				a = d.S(a, "IMG"),
				e;
				if (a && a.alt) e = a.alt;
				else if (f) e = f;
				else if (b.innerHTML) e = b.innerHTML;
				return e ? e: c
			},
			t: function(a) {
				if (!this.H) this.ca = this.H = !0,
				this.ia(a.argsa),
				this.A(a.argsa)
			},
			s: function(a) {
				if (this.ca) {
					var b = this;
					a.finish = function() {
						b.ha();
						b.H = !1
					};
					this.ca = !1
				}
			},
			L: function(a) {
				var b = !1;
				if (!a) a = window.event;
				a.which ? b = a.which == 3 : a.button && (b = a.button == 2);
				return b
			},
			Oa: function() {
				this.p("a", {
					filter: function(a, b) {
						var c = b.element || {},
						d = b.event || {};
						return c.hostname && !a.fa(c.hostname, a.h) && !a.L(d) ? !1 : !0
					},
					transform: function(a, b) {
						var c = b.element || {};
						a.t(b);
						c = a.F(c);
						b.argsa.push("DCS.dcssip", c.C, "DCS.dcsuri", c.l, "DCS.dcsqry", c.i, "DCS.dcsref", c.B, "WT.ti", "Offsite:" + c.C + c.l + (c.i.length ? "?" + c.i: ""), "WT.dl", "24");
						a.s(b)
					}
				})
			},
			La: function() {
				this.p("a", {
					filter: function(a, b) {
						var c = b.element || {},
						d = b.event || {};
						return a.fa(c.hostname, a.h) && c.hash && c.hash != "" && c.hash != "#" && !a.L(d) ? !1 : !0
					},
					transform: function(a, b) {
						var c = b.event || {},
						d = b.element || {};
						a.t(b);
						d = a.F(d);
						b.argsa.push("DCS.dcssip", d.C, "DCS.dcsuri", escape(d.l + b.element.hash), "DCS.dcsqry", d.i, "DCS.dcsref", d.B, "WT.ti", escape("Anchor:" + b.element.hash), "WT.nv", a.R(c, a.G), "WT.dl", "21");
						a.s(b)
					}
				})
			},
			Ma: function() {
				this.p("a", {
					filter: function(a, b) {
						var c = b.event || {};
						return a.ka((b.element || {}).pathname, a.K) && !a.L(c) ? !1 : !0
					},
					transform: function(a, b) {
						var c = b.event || {},
						d = b.element || {};
						a.t(b);
						var e = a.F(d);
						b.argsa.push("DCS.dcssip", e.C, "DCS.dcsuri", e.l, "DCS.dcsqry", e.i, "DCS.dcsref", e.B, "WT.ti", "Download:" + a.sa(c, d, e.l), "WT.nv", a.R(c, a.G), "WT.dl", "20");
						a.s(b)
					}
				})
			},
			Pa: function() {
				this.p("a", {
					filter: function(a, b) {
						var c = b.event || {};
						return a.ka((b.element || {}).pathname, a.K) && a.L(c) ? !1 : !0
					},
					transform: function(a, b) {
						var c = b.event || {},
						d = b.element || {};
						a.t(b);
						var e = a.F(d);
						b.argsa.push("DCS.dcssip", e.C, "DCS.dcsuri", e.l, "DCS.dcsqry", e.i, "DCS.dcsref", e.B, "WT.ti", "RightClick:" + a.sa(c, d, e.l), "WT.nv", a.R(c, a.G), "WT.dl", "25");
						a.s(b)
					}
				})
			},
			Na: function() {
				this.p("a", {
					filter: function(a, b) {
						var c = b.element || {};
						return c.href && c.protocol && c.protocol.toLowerCase() == "javascript:" ? !1 : !0
					},
					transform: function(a, b) {
						var c = b.event || {},
						d = b.element || {};
						a.t(b);
						var e = a.F(d);
						b.argsa.push("DCS.dcssip", j.location.hostname, "DCS.dcsuri", d.href, "DCS.dcsqry", e.i, "DCS.dcsref", e.B, "WT.ti", "JavaScript:" + (d.innerHTML ? d.innerHTML: ""), "WT.dl", "22", "WT.nv", a.R(c, a.G));
						a.s(b)
					}
				})
			},
			Ta: function() {
				if (i.links) {
					var a = this.M + "=",
					b = a.length,
					a = RegExp(a, "i"),
					c = i.links.length,
					d = end = -1,
					e = urlp = value = "",
					g,
					e = i.URL + "",
					d = e.search(a);
					d != -1 && (end = e.indexOf("&", d), urlp = e.substring(d, end != -1 ? end: e.length), g = RegExp(urlp + "(&|#)", "i"));
					for (var h = 0; h < c; h++) if (i.links[h].href && (e = i.links[h].href + "", urlp.length > 0 && (e = e.replace(g, "$1")), d = e.search(a), d != -1)) d += b,
					end = e.indexOf("&", d),
					value = e.substring(d, end != -1 ? end: e.length),
					this.c.ad = this.c.ad ? this.c.ad + ";" + value: value
				}
			}
		};
		d.a.prototype.action_multitrack = d.a.prototype.Ka;
		d.a.prototype.action_collect = d.a.prototype.Ja;
		j.dcsMultiTrack = function() {
			for (var a = [], b = 0; b < arguments.length; b++) a[b] = arguments[b];
			d.wa({
				Ra: a
			})
		};
		j.Webtrends = d;
		j.WebTrends = d;
		j.WT = j.Webtrends;
		j.dcsDebug = d.z;
		d.multiTrack = d.wa;
		d.dcs = d.a;
		d.dcss = d.b;
		d.addTransform = d.N;
		d.bindEvent = d.O;
		d.getQryParams = d.ra;
		d.dcsdelay = d.q;
		d.find = d.find;
		d.registerPlugin = d.Z;
		d.dcsDebug = d.z;
		d.a.prototype.init = d.a.prototype.Y;
		d.a.prototype.dcsMultiTrack = d.a.prototype.ga;
		d.a.prototype.track = d.a.prototype.zb;
		d.a.prototype.addSelector = d.a.prototype.p;
		d.a.prototype.dcsGetIdCallback = d.a.prototype.ab;
		d.a.prototype.dcsDebug = d.a.prototype.z;
		d.a.prototype.dcsCleanUp = d.a.prototype.Ua;
		d.a.prototype.dcsGetFPC = d.a.prototype.Za;
		d.a.prototype.addTransform = d.a.prototype.N;
		d.Y()
	}
})(window, window.document, window.navigator, window.location);