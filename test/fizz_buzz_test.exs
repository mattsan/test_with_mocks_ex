defmodule FizzBuzzTest do
  use ExUnit.Case

  import Mock
  import FizzBuzz

  describe "case 1" do
    test "fizz_buzz 1" do
      with_mock System, cmd: fn "fb", ["1"] -> {"1", 0} end do
        assert fizz_buzz(1) == "1"
      end
    end
  end

  describe "case 3" do
    test "fizz_buzz 3" do
      with_mocks [{System, [], [cmd: fn "fb", ["3"] -> {"Fizz", 0} end]}] do
        assert fizz_buzz(3) == "Fizz"
      end
    end
  end

  describe "case 5" do
    setup_with_mocks [{System, [], [cmd: fn "fb", ["5"] -> {"Buzz", 0} end]}] do
      :ok
    end

    test "fizz_buzz 5" do
      assert fizz_buzz(5) == "Buzz"
    end
  end

  test_with_mock "fizz_buzz 9", System, cmd: fn "fb", ["9"] -> {"Fizz", 0} end do
    assert fizz_buzz(9) == "Fizz"
  end

  describe "case 15" do
    test "fizz_buzz 15" do
      mock = fn "fb", ["15"] -> {"FizzBuzz", 0} end

      with_mock System, cmd: mock do
        assert fizz_buzz(15) == "FizzBuzz"
        assert called(System.cmd("fb", ["15"]))
      end
    end
  end
end
