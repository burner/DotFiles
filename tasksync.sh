#!/bin/bash                                                                                                                                                                                    
# This hooks script syncs task warrior to the configured task server.
# The on-exit event is triggered once, after all processing is complete.

# Make sure hooks are enabled

LOCK_FILE=~/.task/autosync.lock

if [ ! -f $LOCK_FILE ]; then
  touch $LOCK_FILE

  # Only sync, if the backlog is not empty
  if ((`cat ~/.task/backlog.data | wc -l` > 1)); then
    task sync >> ~/.task/sync_hook.log
  fi  

  rm $LOCK_FILE
fi

exit 0
