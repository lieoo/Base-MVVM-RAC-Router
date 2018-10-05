fixMethod("Test", "changePrames:", 2, function(instance, invocation, arg) {
          var className = runMethod("LYComAPI","classNameWithInstance:",instance);
          if (className == 'Test') {
          runLog('11111');
          var params = new Array();
          params[0] = 'newParams'
          setInvocationArguments(invocation,params);
          } else {
          runLog('00000');
          }
          });
