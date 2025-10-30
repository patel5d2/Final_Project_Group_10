# 🚨 IMPORTANT: Manual Steps Required

## ⚠️ YOU MUST CREATE THESE FILES MANUALLY

Due to technical limitations, I couldn't create the Views\Rooms folder automatically.
**You must create it yourself** and add the three view files below.

---

## 📁 Step 1: Create Folder

**In File Explorer:**
```
Navigate to: C:\Users\user\Desktop\Class server\Final_Project_Group_10\Final_Project_Group_10\Views\

Create new folder named: Rooms
```

**In Visual Studio:**
```
1. Right-click on "Views" folder in Solution Explorer
2. Select "Add" → "New Folder"
3. Name it: Rooms
```

---

## 📄 Step 2: Create Three Files

You need to create these 3 files inside `Views\Rooms\`:

1. ✅ **Index.cshtml**
2. ✅ **Details.cshtml**  
3. ✅ **Create.cshtml**

---

## 📝 File 1: Index.cshtml

**Full Path:** `Views\Rooms\Index.cshtml`

**Content:**

```cshtml
@model IEnumerable<Final_Project_Group_10.Models.Room>

@{
    ViewData["Title"] = "Available Rooms";
}

<div class="container mt-4">
    <h1>@ViewData["Title"]</h1>
    <p>Browse and select from our available rooms for booking.</p>

    <p>
        <a asp-action="Create" class="btn btn-primary">Add New Room</a>
    </p>

    <div class="row">
        @if (Model != null && Model.Any())
        {
            @foreach (var room in Model)
            {
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">@room.Name</h5>
                            <p class="card-text">
                                <strong>Location:</strong> @room.Location<br />
                                <strong>Capacity:</strong> @room.Capacity people<br />
                                <strong>Status:</strong>
                                @if (room.IsAvailable)
                                {
                                    <span class="badge bg-success">Available</span>
                                }
                                else
                                {
                                    <span class="badge bg-danger">Unavailable</span>
                                }
                            </p>
                            <a asp-action="Details" asp-route-id="@room.Id" class="btn btn-sm btn-outline-primary">View Details</a>
                        </div>
                    </div>
                </div>
            }
        }
        else
        {
            <div class="col-12">
                <div class="alert alert-info">No rooms available at the moment.</div>
            </div>
        }
    </div>
</div>
```

---

## 📝 File 2: Details.cshtml

**Full Path:** `Views\Rooms\Details.cshtml`

**Content:**

```cshtml
@model Final_Project_Group_10.Models.Room

@{
    ViewData["Title"] = "Room Details";
}

<div class="container mt-4">
    <h1>@ViewData["Title"]</h1>

    <div class="card">
        <div class="card-header">
            <h4>@Model.Name</h4>
        </div>
        <div class="card-body">
            <dl class="row">
                <dt class="col-sm-3">Room ID</dt>
                <dd class="col-sm-9">@Model.Id</dd>

                <dt class="col-sm-3">Location</dt>
                <dd class="col-sm-9">@Model.Location</dd>

                <dt class="col-sm-3">Capacity</dt>
                <dd class="col-sm-9">@Model.Capacity people</dd>

                <dt class="col-sm-3">Availability Status</dt>
                <dd class="col-sm-9">
                    @if (Model.IsAvailable)
                    {
                        <span class="badge bg-success">Available</span>
                    }
                    else
                    {
                        <span class="badge bg-danger">Unavailable</span>
                    }
                </dd>

                @if (!string.IsNullOrEmpty(Model.Description))
                {
                    <dt class="col-sm-3">Description</dt>
                    <dd class="col-sm-9">@Model.Description</dd>
                }
            </dl>

            <div class="mt-4">
                @if (Model.IsAvailable)
                {
                    <a href="#" class="btn btn-success">Book This Room</a>
                }
                else
                {
                    <button class="btn btn-secondary" disabled>Room Not Available</button>
                }
                <a asp-action="Index" class="btn btn-outline-secondary">Back to List</a>
            </div>
        </div>
    </div>
</div>
```

---

## 📝 File 3: Create.cshtml

**Full Path:** `Views\Rooms\Create.cshtml`

**Content:**

```cshtml
@model Final_Project_Group_10.Models.Room

@{
    ViewData["Title"] = "Create New Room";
}

<div class="container mt-4">
    <h1>@ViewData["Title"]</h1>

    <hr />
    <div class="row">
        <div class="col-md-8">
            <form asp-action="Create" method="post">
                <div asp-validation-summary="ModelOnly" class="text-danger"></div>
                
                <div class="form-group mb-3">
                    <label asp-for="Name" class="control-label"></label>
                    <input asp-for="Name" class="form-control" placeholder="e.g., Conference Room A" />
                    <span asp-validation-for="Name" class="text-danger"></span>
                </div>

                <div class="form-group mb-3">
                    <label asp-for="Location" class="control-label"></label>
                    <input asp-for="Location" class="form-control" placeholder="e.g., Building 1, Floor 2" />
                    <span asp-validation-for="Location" class="text-danger"></span>
                </div>

                <div class="form-group mb-3">
                    <label asp-for="Capacity" class="control-label"></label>
                    <input asp-for="Capacity" class="form-control" type="number" min="1" max="500" />
                    <span asp-validation-for="Capacity" class="text-danger"></span>
                </div>

                <div class="form-group mb-3">
                    <label asp-for="Description" class="control-label"></label>
                    <textarea asp-for="Description" class="form-control" rows="4" placeholder="Optional room description"></textarea>
                    <span asp-validation-for="Description" class="text-danger"></span>
                </div>

                <div class="form-check mb-3">
                    <input asp-for="IsAvailable" class="form-check-input" type="checkbox" checked />
                    <label asp-for="IsAvailable" class="form-check-label">Room is Available</label>
                </div>

                <div class="form-group">
                    <input type="submit" value="Create Room" class="btn btn-primary" />
                    <a asp-action="Index" class="btn btn-outline-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</div>

@section Scripts {
    @{await Html.RenderPartialAsync("_ValidationScriptsPartial");}
}
```

---

## ✅ Verification Checklist

After creating the files, verify:

- [ ] Folder `Views\Rooms\` exists
- [ ] File `Views\Rooms\Index.cshtml` exists
- [ ] File `Views\Rooms\Details.cshtml` exists
- [ ] File `Views\Rooms\Create.cshtml` exists
- [ ] All files have correct content (no typos)
- [ ] Files are saved with UTF-8 encoding

---

## 🧪 Test Your Work

After creating the files:

### 1. Build the project
```bash
dotnet build
```

### 2. Run the application
```bash
dotnet run
```

### 3. Test these URLs
```
✅ https://localhost:5001/
✅ https://localhost:5001/Rooms
✅ https://localhost:5001/Rooms/Details/1
✅ https://localhost:5001/Rooms/Create
```

---

## 🎯 Expected Results

### Homepage (/)
- Should show "Room Booking & Scheduling System"
- Should have 3 cards (Browse, Book, Manage)
- "View All Rooms" button should work

### Rooms Page (/Rooms)
- Should show 4 sample rooms in cards
- Each card shows: Name, Location, Capacity, Status
- "View Details" button on each card
- "Add New Room" button at top

### Room Details (/Rooms/Details/1)
- Should show details of Conference Room A
- Should show "Book This Room" button
- Should have "Back to List" button

### Create Room (/Rooms/Create)
- Should show form with fields
- All fields should have labels
- Submit button should work

---

## 🆘 Troubleshooting

### "Page not found" error
- Make sure folder is named exactly `Rooms` (capital R)
- Make sure files are named exactly as shown (capital letters matter)

### "Could not find view" error  
- Verify files are in correct location: `Views\Rooms\`
- Rebuild the project: `dotnet build`
- Restart the application

### Compilation errors
- Check for typos in the file content
- Make sure all `@` symbols are present
- Verify closing tags match opening tags

---

## 📞 Quick Help

**If you see errors**, check:
1. ✅ File names are correct (exact spelling, capitalization)
2. ✅ Files are in correct folder (`Views\Rooms\`)
3. ✅ Code is copied completely (no missing lines)
4. ✅ No extra spaces or characters added

**After creating files successfully:**
- Continue with Git setup (see GIT_INSTRUCTIONS.md)
- Follow next milestone guide (see NEXT_MILESTONE.md)

---

## 🎉 Once Complete

After creating these files, your project structure will be:

```
Views/
├── Home/
│   ├── Index.cshtml
│   └── Privacy.cshtml
├── Rooms/                    ← YOU CREATE THIS
│   ├── Index.cshtml         ← YOU CREATE THIS
│   ├── Details.cshtml       ← YOU CREATE THIS
│   └── Create.cshtml        ← YOU CREATE THIS
└── Shared/
    └── _Layout.cshtml
```

**Then your Milestone 1 will be 100% complete!** 🎊

---

**Created:** October 30, 2025  
**Status:** 🔴 MANUAL ACTION REQUIRED
