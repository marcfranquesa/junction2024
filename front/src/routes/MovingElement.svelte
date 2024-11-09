<script>
    import { onMount, onDestroy } from 'svelte';
    import * as THREE from 'three';

    let container;
    let animationFrameId;
    let mouseX = 0;
    let mouseY = 0;
    let targetRotationX = 0;
    let targetRotationY = 0;
    
    onMount(() => {
        // Scene setup
        const scene = new THREE.Scene();
        const camera = new THREE.PerspectiveCamera(75, 1, 0.1, 1000);
        const renderer = new THREE.WebGLRenderer({ 
            alpha: true,
            antialias: true 
        });
        
        // Set size - you can adjust this size to make the sphere more visible
        const size = 80; // Increase the size for better visibility
        renderer.setSize(size, size);
        renderer.setPixelRatio(window.devicePixelRatio);
        container.appendChild(renderer.domElement);
        
        // Create sphere with wireframe effect
        const geometry = new THREE.SphereGeometry(1, 32, 32);
        
        // Create two materials: one for the solid sphere and one for wireframe
        const material = new THREE.MeshPhongMaterial({
            color: 0x2563eb,
            transparent: true,
            opacity: 0.3,
            shininess: 100
        });
        
        const wireframeMaterial = new THREE.MeshPhongMaterial({
            color: 0x4488ff,
            wireframe: true,
            transparent: true,
            opacity: 0.2
        });

        // Create two spheres - one solid and one wireframe
        const sphere = new THREE.Mesh(geometry, material);
        const wireframe = new THREE.Mesh(geometry, wireframeMaterial);
        
        // Group them together
        const sphereGroup = new THREE.Group();
        sphereGroup.add(sphere);
        sphereGroup.add(wireframe);
        scene.add(sphereGroup);
        
        // Add lights
        const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
        scene.add(ambientLight);
        
        const pointLight = new THREE.PointLight(0xffffff, 1);
        pointLight.position.set(5, 5, 5);
        scene.add(pointLight);
        
        // Position camera
        camera.position.z = 3;
        
        // Handle mouse movement
        function handleMouseMove(event) {
            const rect = container.getBoundingClientRect();
            mouseX = ((event.clientX - rect.left) / size) * 2 - 1;
            mouseY = -((event.clientY - rect.top) / size) * 2 + 1;
            
            // Smooth rotation target update
            targetRotationX = mouseY * 0.5;
            targetRotationY = mouseX * 0.5;
        }

        // Handle touch movement
        function handleTouchMove(event) {
            event.preventDefault();
            const touch = event.touches[0];
            const rect = container.getBoundingClientRect();
            mouseX = ((touch.clientX - rect.left) / size) * 2 - 1;
            mouseY = -((touch.clientY - rect.top) / size) * 2 + 1;
            
            targetRotationX = mouseY * 0.5;
            targetRotationY = mouseX * 0.5;
        }
        
        // Animation function with smooth rotation
        function animate() {
            animationFrameId = requestAnimationFrame(animate);
            
            // Smooth rotation
            sphereGroup.rotation.x += (targetRotationX - sphereGroup.rotation.x) * 0.05;
            sphereGroup.rotation.y += (targetRotationY - sphereGroup.rotation.y) * 0.05;
            
            // Add subtle continuous rotation
            sphereGroup.rotation.y += 0.003;
            
            renderer.render(scene, camera);
        }
        
        // Handle resize
        function handleResize() {
            camera.aspect = 1;
            camera.updateProjectionMatrix();
            renderer.setSize(size, size);
        }
        
        // Add event listeners
        container.addEventListener('mousemove', handleMouseMove);
        container.addEventListener('touchmove', handleTouchMove, { passive: false });
        window.addEventListener('resize', handleResize);
        
        animate();
        
        return () => {
            container.removeEventListener('mousemove', handleMouseMove);
            container.removeEventListener('touchmove', handleTouchMove);
            window.removeEventListener('resize', handleResize);
            if (animationFrameId) {
                cancelAnimationFrame(animationFrameId);
            }
            if (renderer) {
                renderer.dispose();
            }
        };
    });
</script>

<div
    bind:this={container}
    class="moving-element"
>
</div>

<style>
    .moving-element {
        position: absolute;
        right: 0;
        top: 50%;
        transform: translateY(-50%);
        width: 80px; /* Adjust width to match the size of the sphere */
        height: 80px; /* Adjust height */
    }
    
    .moving-element :global(canvas) {
        position: absolute;
        top: 0;
        left: 0;
        width: 100% !important;
        height: 100% !important;
    }
</style>

