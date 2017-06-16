package utils;

public class Check {

	public static int[] checkArgsAreInt(Object[] args) {
		int[] res = new int[args.length];

		for (int i = 0; i < args.length; i++) {
			try {
				res[i] = Integer.parseInt((String) args[i]);
			} catch (NumberFormatException e) {
				return null;
			}
		}

		return res;
	}

	public static boolean checkArgsNumber(Object[] args, int number) {

		return args.length <= number;
	}

	public static boolean containsRoute(String[][] routes, String[] params) {

		boolean res = true;

		for (int i = 0; i < routes.length; i++) {

			String[] route = routes[i];

			if (route.length != params.length)
				continue;

			for (int j = 0; j < route.length; j++)

				if (!params[j].equalsIgnoreCase(route[j]))
					res = false;

			if (res)
				return true;

			else
				res = true;
		}

		return false;
	}
}