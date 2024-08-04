CREATE TABLE IF NOT EXISTS  carts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    created_at DATE NOT NULL DEFAULT CURRENT_DATE,
    updated_at DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL CHECK (status IN ('OPEN', 'ORDERED'))
);

CREATE TABLE IF NOT EXISTS  cart_items (
    cart_id UUID REFERENCES carts(id) ON DELETE CASCADE,
    product_id UUID NOT NULL,
    count INTEGER NOT NULL CHECK (count > 0),
    PRIMARY KEY (cart_id, product_id)
);

INSERT INTO carts (user_id, created_at, updated_at, status) VALUES
    ('123e4567-e89b-12d3-a456-426614174000', CURRENT_DATE, CURRENT_DATE, 'OPEN'),
    ('123e4567-e89b-12d3-a456-426614174001', CURRENT_DATE, CURRENT_DATE, 'ORDERED');
ON CONFLICT (id) DO NOTHING;

INSERT INTO cart_items (cart_id, product_id, count) VALUES
    ('c1a47d17-1c8e-48b4-93de-2d00d040af21', 'f2a47d17-1c8e-48b4-93de-2d00d040af22', 2),
    ('c1a47d17-1c8e-48b4-93de-2d00d040af21', 'f2a47d17-1c8e-48b4-93de-2d00d040af23', 3),
    ('c1a47d17-1c8e-48b4-93de-2d00d040af22', 'f2a47d17-1c8e-48b4-93de-2d00d040af24', 1);
ON CONFLICT DO NOTHING;