#!/bin/bash
for i in {1..5}; do
  logger "🚨 LAB-EVENT from $(hostname) at $(date)"
  sleep 1
done
