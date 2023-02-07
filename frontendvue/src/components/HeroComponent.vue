<template>
  <div
    id="hero"
    class="min-h-screen w-full bg-center bg-no-repeat bg-cover flex flex-col justify-center"
  >
    <div
      class="h-screen backdrop-grayscale-0 bg-gray-600/30 md:h-screen w-full bg-black-50 flex flex-col justify-end"
    >
      <div
        class="container-fluid flex p-12 mx-auto px-4 sm:px-6 lg:px-8 w-full"
      >
        <!-- Left item -->
        <div class="w-1/2 flex flex-col text-left gap-8 text-white">
          <h1 class="text-4xl font-bold">Dune</h1>
          <h1 class="text-md">8.9 2h 35m Action, 2021</h1>
          <P class="">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis
            explicabo facere maiores possimus vel quo accusamus reprehenderit
            corrupti, repudiandae in ipsa inventore itaque voluptatibus unde
            quisquam maxime eos cupiditate dolore.
          </P>
        </div>
        <!-- Right item -->
      
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "HeroComponent",
};
</script>

<style scoped>
#hero {
  background-image: url("../assets/wallpaper.jpg");
}
</style>
