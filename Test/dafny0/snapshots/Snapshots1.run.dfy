// RUN: %dafny /compile:0 /verifySnapshots:2 /traceCaching:1 "%S/Inputs/Snapshots1.dfy" > "%t"
// RUN: %diff "%s.expect" "%t"
