#*********************************************************************
#
#   nSystemUtils.py by N. Chaverou
#   A set of convenient System based functions
#
#*********************************************************************

import types
import inspect

#**********************************************************************
# Python specific
#**********************************************************************

# Return all explicitely imported modules
def getImportedModules():
    importedModules = []
    for name, val in globals().items():
        if isinstance(val, types.ModuleType):
            importedModules.append(val.__name__)
    return importedModules

# Return all [name, data] functions of a module
def getAllCallableOfAModule(moduleName):
    return inspect.getmembers(moduleName, callable)
