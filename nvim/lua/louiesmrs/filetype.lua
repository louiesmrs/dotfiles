-- GLSL filetype detection configuration
-- This ensures that Neovim properly recognizes GLSL files with various extensions

vim.filetype.add({
    extension = {
        glsl = 'glsl',
        vert = 'glsl',
        frag = 'glsl',
        geom = 'glsl',
        tesc = 'glsl',
        tese = 'glsl',
        comp = 'glsl',
        vs = 'glsl',
        fs = 'glsl',
        gs = 'glsl',
        tcs = 'glsl',
        tes = 'glsl',
        cs = 'glsl',
        mesh = 'glsl',
        task = 'glsl',
        rgen = 'glsl',
        rint = 'glsl',
        rahit = 'glsl',
        rchit = 'glsl',
        rmiss = 'glsl',
        rcall = 'glsl',
    },
    filename = {
        ['.glslangvalidatorrc'] = 'json',
    },
    pattern = {
        ['.*%.glsl$'] = 'glsl',
        ['.*%.vert$'] = 'glsl',
        ['.*%.frag$'] = 'glsl',
        ['.*%.geom$'] = 'glsl',
        ['.*%.tesc$'] = 'glsl',
        ['.*%.tese$'] = 'glsl',
        ['.*%.comp$'] = 'glsl',
    },
})
