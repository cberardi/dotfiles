#!/bin/sh

inset() {
  mag=$(($1 * $1 + $2 * $2))
  if [ $mag -gt "40000" ] || [ $5 -ge $6 ]; then
    echo $5
  else
    r=$((($1 * $1)/100 - ($2 * $2)/100 + $3))
    i=$((($1 * $2)/100 * 2 + $4))
    c=$(($5 + 1))
    inset $r $i $3 $4 $c $6
  fi
}

for y in `seq -20 20`; do
  for x in `seq -20 20`; do
    rval=$((x * 10))
    ival=$((y * 10))
    val=$(inset $rval $ival $rval $ival 1 10)
    if [ $val -eq 10 ]; then
      echo -n ".";
    else
      echo -n $val;
    fi
  done
  echo
done
