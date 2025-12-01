/*
 * sysfs
 *
 * Devices may export their attributes through sysfs, where registered show and
 * store callbacks can be considered functional entrypoints. All show and store
 * callbacks should be documented as LLR.
 *
 * This implements a searches for macros DEVICE_ATTR, DEVICE_ATTR_RO,
 * DEVICE_ATTR_RW, and then finds the name and position of the show and store
 * callbacks assigned by the macros.
 */


// DEVICE_ATTR

@device_attr@
declarer name DEVICE_ATTR;
identifier attr_name, show_fn, store_fn;
position p;
@@
  DEVICE_ATTR(@p attr_name, ..., show_fn, store_fn);

@device_attr_show_fn@
identifier device_attr.show_fn;
position p_fn;
@@
  show_fn@p_fn(...) {...}

@device_attr_store_fn@
identifier device_attr.store_fn;
position p_fn;
@@
  store_fn@p_fn(...) {...}


// DEVICE_ATTR_RO

@device_attr_ro@
declarer name DEVICE_ATTR_RO;
typedef __DEVICE_ATTR_RO_T;
identifier attr_name;
fresh identifier show_fn_name = attr_name ## "_show";
@@
  DEVICE_ATTR_RO(attr_name);
+ __DEVICE_ATTR_RO_T attr_name = show_fn_name;

/* Helper construct needed to match on concatenated identifier. */
@device_attr_ro_2@
identifier device_attr_ro.attr_name;
identifier show_fn;
@@
  __DEVICE_ATTR_RO_T attr_name = show_fn;

@device_attr_ro_show_fn@
identifier device_attr_ro_2.show_fn;
position p_fn;
@@
  show_fn@p_fn(...) {...}


// DEVICE_ATTR_RW

@device_attr_rw@
declarer name DEVICE_ATTR_RW;
typedef __DEVICE_ATTR_RW_SHOW_T;
typedef __DEVICE_ATTR_RW_STORE_T;
identifier attr_name;
fresh identifier show_fn_name = attr_name ## "_show";
fresh identifier store_fn_name = attr_name ## "_store";
@@
  DEVICE_ATTR_RW(attr_name);
+ __DEVICE_ATTR_RW_SHOW_T attr_name = show_fn_name;
+ __DEVICE_ATTR_RW_STORE_T attr_name = store_fn_name;

/* Helper construct needed to match on concatenated identifier. */
@device_attr_rw_show2@
identifier device_attr_rw.attr_name;
identifier fn;
@@
  __DEVICE_ATTR_RW_SHOW_T attr_name = fn;

/* Helper construct needed to match on concatenated identifier. */
@device_attr_rw_store2@
identifier device_attr_rw.attr_name;
identifier fn;
@@
  __DEVICE_ATTR_RW_STORE_T attr_name = fn;

@device_attr_rw_show_fn@
identifier device_attr_rw_show2.fn;
position p_fn;
@@
  fn@p_fn(...) {...}

@device_attr_rw_store_fn@
identifier device_attr_rw_store2.fn;
position p_fn;
@@
  fn@p_fn(...) {...}


// Report

@script:python@
fn << device_attr.show_fn;
p << device_attr_show_fn.p_fn;
@@
print(f"sysfs show_fn: {fn} at {p[0].file}:{p[0].line}")

@script:python@
fn << device_attr.store_fn;
p << device_attr_store_fn.p_fn;
@@
print(f"sysfs store_fn: {fn} at {p[0].file}:{p[0].line}")

@script:python@
fn << device_attr_ro_2.show_fn;
p << device_attr_ro_show_fn.p_fn;
@@
print(f"sysfs show_fn (RO): {fn} at {p[0].file}:{p[0].line}")

@script:python@
fn << device_attr_rw_show2.fn;
p << device_attr_rw_show_fn.p_fn;
@@
print(f"sysfs show_fn (RW): {fn} at {p[0].file}:{p[0].line}")

@script:python@
fn << device_attr_rw_store2.fn;
p << device_attr_rw_store_fn.p_fn;
@@
print(f"sysfs store_fn (RW): {fn} at {p[0].file}:{p[0].line}")
