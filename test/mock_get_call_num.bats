#!/usr/bin/env bats

load mock_test_suite

@test 'mock_get_call_num requires mock to be specified' {
  run mock_get_call_num
  [[ "${status}" -eq 1 ]]
# NOTE: No need to address SC2076 here.
# shellcheck disable=SC2076
  [[ "${output}" =~ 'Mock must be specified' ]]
}

@test 'mock_get_call_num outputs the number of calls' {
# NOTE: mock is assigned elsewhere.
# shellcheck disable=SC2154
  run mock_get_call_num "${mock}"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" -eq 0 ]]
  "${mock}"
  run mock_get_call_num "${mock}"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" -eq 1 ]]
  "${mock}"
  run mock_get_call_num "${mock}"
  [[ "${status}" -eq 0 ]]
  [[ "${output}" -eq 2 ]]
}
