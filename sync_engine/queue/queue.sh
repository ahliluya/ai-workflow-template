#!/bin/bash

QUEUE_FILE=~/AI_WORKSPACE/sync_engine/queue/queue.log

touch $QUEUE_FILE

# V3.2：排序 + 去重（保证稳定流）
sort $QUEUE_FILE | uniq > $QUEUE_FILE.tmp
mv $QUEUE_FILE.tmp $QUEUE_FILE
