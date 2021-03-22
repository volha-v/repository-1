public class NumberUtility {
    public static List < Integer > findPrime() {
        Integer n = 104;
        List < Integer > prime = new List < Integer > ();

        for (Integer i = 2; i < n; i++) {
            Integer k = 0;
            for (Integer j = 2; j <= i; j++) {
                if (math.mod(i, j) == 0) {
                    k++;
                }
            }
            if (k < 2) {
                prime.add(i);
            }

        }

        return prime;
    }

    public static List < Integer > findFibonacci() {
        Integer m = 104;
        List < Integer > numFibonacci = new List < Integer > {
            0
        };
        Integer f0 = 0;
        Integer f1 = 1;
        Integer fn = 1;

        while (fn <= m) {
            numFibonacci.add(fn);
            fn = f1 + f0;
            f0 = f1;
            f1 = fn;
        }
        return numFibonacci;
    }

    public static Boolean isPalindrome() {
        Long n = 910019;
        Long rev = 0;
        Long temp = n;

        while (n > 0) {
            rev = rev * 10;
            rev = rev + math.mod(n, 10);
            n = n / 10;
        }
        if (rev == temp) {
            return true;
        } else {
            return false;
        }
    }

}