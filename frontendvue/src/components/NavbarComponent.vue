<template>
  <header>
    <nav
      class="container mx-auto bg-gray-900 border-gray-200 p-4 tracking-wider"
    >
      <div
        class="container flex flex-wrap items-center justify-between mx-auto"
      >
        <a href="http://localhost:8080/" class="flex items-center">
          <!-- <img src="https://flowbite.com/docs/images/logo.svg" class="h-6 mr-3 sm:h-9" alt="Flowbite Logo" /> -->
          <span
            class="self-center text-xl font-semibold whitespace-nowrap text-white"
            ><span class="text-red-600">Cine</span> Hall</span
          >
        </a>

        <!-- Search Button -->
        <div class="flex md:order-2">
          <div class="relative hidden md:flex gap-8">
            <router-link
              to="/signup"
              v-if="!user_ref"
              class="flex items-center text-red-700 font-bold px-3 py-2 rounded backdrop-blur-sm bg-white/10"
              >Sign in</router-link
            >
            <button
              v-else
              class="flex items-center text-red-700 font-bold pX-3 PY6é rounded backdrop-blur-sm bg-white/10"
            >
              logout
            </button>

            <button
              class="flex items-center pointer-events-none px-3 py-2 rounded backdrop-blur-sm bg-white/10"
            >
              <svg
                class="w-5 h-5 text-gray-500"
                aria-hidden="true"
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                  clip-rule="evenodd"
                ></path>
              </svg>

              <span class="sr-only">Search icon</span>
            </button>
          </div>
        </div>
        <!--  Items  -->
        <div
          class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1"
          id="items"
        >
          <ul
            class="flex flex-col py-3 px-6 mt-4 border border-gray-100 rounded-md backdrop-blur-sm bg-white/10 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0"
          >
            <li>
              <router-link
                class="block py-2 pl-3 pr-4 text-gray-200 rounded md:bg-transparent md:p-0"
                to="/"
                >Home</router-link
              >
            </li>

            <li>
              <router-link
                class="block py-2 pl-3 pr-4 text-gray-200 rounded hover:bg-white md:hover:bg-transparent md:hover:text-red-700 md:p-0"
                to="/myReservations"
                >Resarvations</router-link
              >
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
</template>
<script>
export default {
  name: "NavbarComponent",
  data() {
    return {
      user_ref: localStorage.getItem("ref"),
      user_name: localStorage.getItem("user_name"),
    };
  },
  methods: {
    logout() {
      localStorage.clear();
    },
  },
};
</script>

<style></style>
