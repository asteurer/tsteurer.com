<script lang="ts">
	let { children } = $props();
</script>

<svelte:head>
	<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</svelte:head>

<nav>
	<h3><a href="/">About</a></h3>
	<h3><a href="/crew-work">Crew Work</a></h3>
	<h3><a href="/past-work">Past Work</a></h3>
	<h3><a href="/resume">Resume</a></h3>
</nav>

{@render children()}

<style>
	:global(body) {
		font-family: 'Comfortaa', cursive;
	}
	nav {
		display: flex;
		justify-content: center;
		text-align: center;
	}
	/* Styles for navigation links */
	nav a {
		color: #434343;
		text-decoration: none;
		padding: 0.3rem 0.5rem;
		border-radius: 4px;
		transition: all 0.2s ease;
	}
	nav a:visited {
		color: #434343;
	}
	nav a:hover {
		color: white;
		background-color: #434343;
	}
	nav h3 {
		margin-right: 1rem;  /* Adds spacing between links */
	}
	nav h3:last-child { /* Remove margin from last link */
		margin-right: 0;
	}
</style>