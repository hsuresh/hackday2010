txt = File.read("0705.txt.dat").split("[[[[[]]]]]")[10]
puts txt
txt.match(/(shri|shrimati|dr. |prof.)\s+(\w+.*\s*\w+)/i)