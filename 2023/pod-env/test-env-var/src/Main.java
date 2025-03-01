import java.util.Map;
import java.util.Properties;

public class Main {
    public static void main(String[] args) {

        // 1. system environment variables
        //      roughly same as printenv -----------------
        // Get the value of all environment variables
        // at once and store it in Map
        Map<String, String> env = System.getenv();

        for (String envName : env.keySet()) {
            System.out.format("%s=%s%n", envName,
                    env.get(envName));
        }

        // 2. system properties -----------------
        System.out.println("\n\n\n");
        System.out.println();
        Properties a = System.getProperties();
        System.out.println("all system properties:\n" + a);

        System.out.println("os.name: "
                + System.getProperty("os.name"));

        String sys_pro1 = System.getProperty("HOME");
        System.out.println("HOME=" + sys_pro1);

//        String sys_pro2 = System.getProperty("MVN_HOME");
//        System.out.println("MVN_HOME=" + sys_pro2);

        // String sys_pro3 = System.getProperty("GRADLE_WORKSPACE");
        // System.out.println("GRADLE_WORKSPACE=" + sys_pro3);

        String sys_pro3 = System.getProperty("aaa-svc");
        System.out.println("aaa.svc=" + sys_pro3);

    }

}