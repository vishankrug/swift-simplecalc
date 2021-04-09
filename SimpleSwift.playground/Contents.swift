print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    if(args[args.count-1] == "count"){
        return args.count-1
    }else if(args[args.count-1] == "avg"){
        if(args.count == 1){
            return 0
        }
        var sum = 0
        for n in 0...args.count-2{
            sum += Int(args[n])!
        }
        return sum/(args.count-1)
    }else if(args[args.count-1] == "fact"){
        if(args.count == 1){
            return 0
        }
        var n = Int(args[0])!
        var sum = 1
        while n>0{
            sum = sum * n
            n = n-1
        }
        return sum
    } else if (args.count == 3){
        let first = Int(args[0])!
        let operate = args[1]
        let second = Int(args[2])!
        
        if(operate == "+"){
            return first+second
        } else if (operate == "-"){
            return first-second
        } else if(operate == "*"){
            return first*second
        } else if(operate == "/"){
            return first/second
        } else if (operate == "%"){
            return first%second
        }
    }
    return -1
}

func calculate(_ arg: String) -> Int {
    let substr = arg.split(separator: " ").map({ (newsubstr) in return String(newsubstr)})
    return calculate(substr)
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculate(_ args: [String]) -> Double {
    if(args.count == 3){
        let first = Double(args[0])!
        let operate = args[1]
        let second = Double(args[2])!
        
        if(operate == "+"){
            return first+second
        } else if (operate == "-"){
            return first-second
        } else if(operate == "*"){
            return first*second
        } else if(operate == "/"){
            return first/second
        } else if (operate == "%"){
            return first.truncatingRemainder(dividingBy: second)
        }
        
    }
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5

