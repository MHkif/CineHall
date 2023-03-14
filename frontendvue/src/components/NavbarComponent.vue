<template>
  <header>
    <nav
      class="container mx-auto bg-gray-900 border-gray-200 p-4 tracking-wider"
    >
      <div
        class="container flex flex-wrap items-center justify-between mx-auto"
      >
        <router-link to="/" class="flex items-center">
          <!-- <img src="https://flowbite.com/docs/images/logo.svg" class="h-6 mr-3 sm:h-9" alt="Flowbite Logo" /> -->
          <span
            class="self-center text-xl font-semibold whitespace-nowrap text-white"
            ><span class="text-red-600">Cine</span> Hall</span
          >
        </router-link>
        <!--  Items  -->
        <div
          class="hidden items-center justify-between w-full md:flex md:w-auto md:order-1 shadow-lg"
          id="items"
        >
          <ul
            class="flex flex-col py-3 px-6 mt-4 gap-4 border border-red-700 rounded backdrop-blur-md bg-white/5 shadow-lg md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium"
          >
            <router-link
              class="block py-2 text-gray-200 rounded md:bg-transparent md:p-0"
              to="/"
              >Home</router-link
            >

            <router-link
              v-model="user_ref"
              class="block py-2 text-gray-100 rounded hover:bg-white md:hover:bg-transparent md:hover:text-red-700 md:p-0"
              to="/myreservations"
              >Resarvations</router-link
            >
          </ul>
        </div>
        <!-- auth Buttons -->
        <div class="flex md:order-2 gap-8">
          <div class="relative hidden md:flex">
            <router-link
              to="/signup"
              v-if="!user_ref"
              class="bg-red-500 text-gray-100 px-3 py-2 rounded tracking-wide font-semibold font-display focus:outline-none focus:shadow-outline hover:text-red-600 hover:border border-red-700 hover:bg-gray-900 shadow-lg"
              >Sign in</router-link
            >

            <!-- <div
              v-else
              class="bg-red-500 text-gray-100 px-3 py-2 rounded tracking-wide font-semibold font-display focus:outline-none focus:shadow-outline hover:text-red-600 hover:border border-red-700 hover:bg-gray-900 shadow-lg"
              @click="logout"
            >
              Logout
            </div> -->
            <i
              @click="logout"
              class="fa-solid fa-right-from-bracket flex items-center text-gray-100 p-3 rounded focus:outline-none focus:shadow-outline hover:text-red-600 border border-red-700 backdrop-blur-sm bg-white/5 hover:bg-gray-800 shadow-lg"
            ></i>
          </div>
          <div @click="toggleNav" class="flex md:hidden">
            <button
              type="button"
              class="flex items-center text-gray-100 p-1 rounded focus:outline-none focus:shadow-outline hover:text-red-700 border border-red-700 bg-gray-900 hover:bg-gray-800 shadow-lg"
              aria-label="toggle menu"
            >
              <svg viewBox="0 0 24 24" class="w-6 h-6 fill-current">
                <path
                  fill-rule="evenodd"
                  d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"
                ></path>
              </svg>
            </button>
          </div>
        </div>
      </div>
    </nav>
   
    <nav
      class="container mx-auto bg-gray-900 border-gray-200 tracking-wider p-0 md:hidden"
      :class="showMenu ? '' : 'hidden'"
    >
      <div
        class="container flex flex-wrap items-center justify-center mx-auto animate-bounce"
      >
        <!--  Items  -->
        <div
          class="flex items-center justify-center w-full shadow-lg"
          id="items"
        >
          <ul
            class="flex flex-col items-center justify-center py-3 px-10 gap-4 border border-red-700 rounded backdrop-blur-md bg-white/5 shadow-lg text-sm font-medium"
          >
            <router-link
              class="block py-2 text-gray-200 rounded md:bg-transparent md:p-0"
              to="/"
              >Home</router-link
            >

            <router-link
              v-model="user_ref"
              class="block py-2 text-gray-100 rounded hover:bg-white hover:bg-transparent hover:text-red-700 md:p-0"
              to="/myreservations"
              >Resarvations</router-link
            >

            <router-link
              to="/signup"
              v-if="!user_ref"
              class="bg-red-500 text-gray-100 px-3 py-2 rounded tracking-wide font-semibold font-display focus:outline-none focus:shadow-outline hover:text-red-600 hover:border border-red-700 hover:bg-gray-900 shadow-lg"
              >Sign in</router-link
            >

            <div
              v-else
              class="w-full text-gray-100 px-3 py-2 rounded tracking-wide font-semibold font-display focus:outline-none focus:shadow-outline hover:text-red-600 border border-red-700 bg-gray-900 shadow-lg"
              @click="logout"
            >
              Logout
              <i
                class="fa-solid fa-right-from-bracket flex items-center text-gray-100 p-2 rounded focus:outline-none focus:shadow-outline"
              ></i>
            </div>
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
      showMenu: false,
    };
  },
  methods: {
    logout() {
      localStorage.clear();
      this.$router.push("/login");
    },
    toggleNav: function () {
      this.showMenu = !this.showMenu;
    },
  },
};
</script>

<style></style>
