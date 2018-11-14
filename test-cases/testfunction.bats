#!/usr/bin/env bats

@test "addition using bc" {
  result="$(echo 2+2 | bc)"
  [ "$result" -eq 4 ]
}


@test "subtraction using bc" {
  result="$(echo 6-2 | bc)"
  [ "$result" -eq 4 ]
}

@test "Issue #7 test case WEB_SERVICE empty" {


}

