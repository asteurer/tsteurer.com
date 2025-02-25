<script>
// Props with default values
export let bottomColor = '#061E45';
export let topColor = '#ffffff';

let containerStyle = `background: linear-gradient(to bottom, ${topColor} 0%, ${topColor} 50%, ${bottomColor} 50%, ${bottomColor} 100%);`;
</script>

<div class="split-background" style={containerStyle}>
<slot></slot>
</div>

<style>
.split-background {
    min-height: 100vh;
    width: 100%;
    display: flex;
    position: relative;
}

/* This ensures the component takes up the full viewport */
:global(body, html) {
    margin: 0;
    padding: 0;
    height: 100%;
    overflow-x: hidden;
}
</style>