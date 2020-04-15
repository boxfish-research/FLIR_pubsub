#test
# To add a new cell, type '# %%'
# To add a new markdown cell, type '# %% [markdown]'
# %%
from IPython import get_ipython

# %%
# default_cls_lvl 3

# %% [markdown]
# # Scratchpad
# > 

# %%
import time
for i in range (100):
    print(':', end='')
    time.sleep(0.1)
    if i % 20 == 0:
        print('')


# %%
from nbdev.showdoc import *
get_ipython().run_line_magic('reload_ext', 'autoreload')
get_ipython().run_line_magic('autoreload', '2')
get_ipython().run_line_magic('matplotlib', 'inline')


# %%
get_ipython().system(' snmpwalk -v 1 -c public 192.168.183.1 1.3.6.1.4.1.14988.1.1.19')


# %%


