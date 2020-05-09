public class main {
    public static void main(String[] args) {

//        double magnitude = Math.pow(10, 3);
//        System.out.println(magnitude);
//        System.out.println( (double) Math.round(522343611/9 * magnitude) / magnitude);

        Integer q = 1;
        Integer w = 1;
        Integer p = 1;

        if (w != null) {
            if (q > 1){
                if (p!=null){
                    System.out.println(q*w/p);
                }
                if (p!=null){
                    System.out.println(q*w/p);
                }
                if (p!=null){
                    System.out.println(q*w/p);
                }
            }else{
                if(p!=null){
                    System.out.println(w/p);
                }
                if(p!=null){
                    System.out.println(w/p);
                }
                if(p!=null){
                    System.out.println(w/p);
                }
            }
        }
        if (q!=null){
            if (p!=null){
                System.out.println(p/q);
            }
            if (p!=null){
                System.out.println(p/q);
            }
            if (p!=null){
                System.out.println(p/q);
            }
        }

        if(p!=null){
            if (w!=null){
                System.out.println(w/p);
            }
            if (q!=null){
                if (w!=null){
                    System.out.println(q*w/p);
                }
            }else{
                System.out.println("单价："+p/q);
            }
        }
        Integer weightCapacity = 1;
        Integer quantity = 1;
        Float price = 1f;
        Float pp = 1f;
        Float lowestPrice = 1f;
        Float actualPayment = 1f;

        if (pp!=null){
            if (weightCapacity!=null){
                //weightCapacity/pp;
            }
            if (quantity!=null){
                if (weightCapacity!=null){
                    //quantity*weightCapacity/pp;
                }
            }else{
                //pp/quantity;
            }
        }

        if (p!=null){
            if (q!=null){
                //单价 p/q
                if (w!=null){
                    //性价比 w*q/p
                }
            }else{
                if (w!=null){
                    //性价比 w/p
                }
            }
        }
    }
}
