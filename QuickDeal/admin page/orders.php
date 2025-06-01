<?php
include '../db/db_conn.php';

// Fetch sold or pending items as orders
$query = "
SELECT 
    i.item_id, 
    u.fullname AS customer, 
    i.created_at AS date, 
    i.status, 
    i.price 
FROM items i
JOIN users u ON i.user_id = u.user_id
WHERE i.status IN ('Sold', 'Pending', 'Cancelled')
ORDER BY i.created_at DESC
";

$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Orders - QuickDeal Dashboard</title>
  <link rel="stylesheet" href="orders.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
  <aside class="sidebar">
    <div class="logo">
      <img src="logo.png" alt="Logo" class="logo-img" />
      <h1>QuickDeal</h1>
    </div>
    <div class="profile">
      <div class="profile-pic">
        <img src="https://m.media-amazon.com/images/M/MV5BNzA1MDBhM2MtMTg0MC00NzUxLWFjZWMtNmE5Y2M3ZDJhYmYyXkEyXkFqcGc@._V1_.jpg" alt="Admin Profile" />
      </div>
      <p>Welcome Admin!</p>
    </div>
    <nav>
      <a href="admin.php">🏠 Dashboard</a>
      <a href="items.php">📦 Items</a>
      <a href="orders.php" class="active">🛒 Order</a>
      <a href="sales.php">📈 Sales Report</a>
      <a href="messages.php">✉️ Messages</a>
      <a href="transaction-history.php">🛍️ Transaction History</a>
      <a href="settings.php">⚙️ Settings</a>
      <a href="signout.php">🚪 Sign Out</a>
    </nav>
  </aside>

  <main class="main">
    <div class="topbar">
      <h2>Orders</h2>
      <input type="text" placeholder="Search orders..." />
    </div>

    <section class="dashboard">
      <div class="card grid-2">
        <h3>Recent Orders</h3>
        <table class="order-table">
          <thead>
            <tr>
              <th>Order ID</th>
              <th>Customer</th>
              <th>Date</th>
              <th>Status</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            <?php while ($row = mysqli_fetch_assoc($result)): ?>
              <tr>
                <td>#ODR<?= str_pad($row['item_id'], 3, '0', STR_PAD_LEFT); ?></td>
                <td><?= htmlspecialchars($row['customer']); ?></td>
                <td><?= date("Y-m-d", strtotime($row['date'])); ?></td>
                <td>
                  <span class="status <?= strtolower($row['status']); ?>">
                    <?= htmlspecialchars($row['status']); ?>
                  </span>
                </td>
                <td>$<?= number_format($row['price'], 2); ?></td>
              </tr>
            <?php endwhile; ?>
          </tbody>
        </table>
      </div>
    </section>
  </main>

  <script>
    const current = window.location.pathname.split('/').pop();
    const links = document.querySelectorAll('.sidebar nav a');
    links.forEach(link => {
      if (link.getAttribute('href') === current) {
        link.classList.add('active');
      } else {
        link.classList.remove('active');
      }
    });
  </script>
</body>
</html>
