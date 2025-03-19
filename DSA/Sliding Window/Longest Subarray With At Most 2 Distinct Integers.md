
Consider `nums = [3, 3, 1, 1, 2]`.

#### **Brute Force (Redundant Steps)**

1. **Start `i = 0`** → Check **`[3]`, `[3,3]`, `[3,3,1]`, `[3,3,1,1]`**, `[3,3,1,1,2]` **(break)**.
2. **Start `i = 1`** → Check **_`[3]` (R), `[3,1]` (R), `[3,1,1]` (R)_**, `[3,1,1,2]` **(break)**.
3. **Start `i = 2`** → Check **_`[1]` (R), `[1,1]` (R)_, `[1,1,2]`**.
4. **Start `i = 3`** → Check **_`[1]` (R) , `[1,2]` (R)_**.
5. **Start `i = 4`** → Check **_`[2]` (R)_** **(end)**.

💡 **Total Redundant checks = 8**.