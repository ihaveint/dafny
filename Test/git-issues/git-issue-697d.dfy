// RUN: %dafny /compile:3 /rprint:"%t.rprint" "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function method nonGhostPredicate(x: int): bool {
  x % 2 == 0
}

datatype Cell = Cell(x: int)
type EvenCell = c: Cell | nonGhostPredicate(c.x) witness Cell(0)

function method doubleEvenCell(c: EvenCell): int
{
   if c.x % 2 == 1 then 1/0 else c.x * 2
}

method Main() {
  var x: set<Cell> := { Cell(1), Cell(2), Cell(3), Cell(4) };
  var y := set c: EvenCell | c in x;
  var b: bool := forall c :: c in y ==> doubleEvenCell(c) > 0;
  assert b;
}
